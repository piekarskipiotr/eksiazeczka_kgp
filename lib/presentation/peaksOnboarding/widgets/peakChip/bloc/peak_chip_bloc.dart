import 'package:bloc/bloc.dart';
import 'package:eksiazeczka_kp/data/models/models.dart';
import 'package:eksiazeczka_kp/data/repositories/repositories.dart';
import 'package:eksiazeczka_kp/presentation/peaksOnboarding/widgets/peakChip/constants/peak_chip_state_status.dart';
import 'package:eksiazeczka_kp/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

part 'peak_chip_event.dart';
part 'peak_chip_state.dart';

class PeakChipBloc extends Bloc<PeakChipEvent, PeakChipState> {
  PeakChipBloc({
    required Peak peak,
    required UserMetadataRepository userMetadataRepository,
    required StorageRepository storageRepository,
  })  : _userMetadataRepository = userMetadataRepository,
        _storageRepository = storageRepository,
        super(PeakChipState(peak: peak)) {
    on<ValidateMemorablePhoto>(_onValidateMemorablePhoto);
    on<SaveMemorablePhoto>(_onSaveMemorablePhoto);
    on<MarkPeakAsConquered>(_onMarkPeakAsConquered);
  }

  final UserMetadataRepository _userMetadataRepository;
  final StorageRepository _storageRepository;

  Future<void> _onValidateMemorablePhoto(ValidateMemorablePhoto event, Emitter<PeakChipState> emit) async {
    try {
      emit(state.copyWith(status: PeakChipStateStatus.validatingMemorablePhoto));
      final isPermissionGranted = await PermissionsHelper.checkPermissionStatus(
        permission: Permission.photos,
        onPermanentlyDenied: () {
          emit(state.copyWith(status: PeakChipStateStatus.addingGalleryPhotoPermissionsPermanentlyDenied));
        },
      );
      if (!isPermissionGranted) return;

      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        emit(state.copyWith(status: PeakChipStateStatus.validatingMemorablePhotoCanceled));
        return;
      }

      final imageCoordinates = await ImageExif.getImageCoordinates(image);
      if (imageCoordinates == null) {
        emit(state.copyWith(status: PeakChipStateStatus.validatingMemorablePhotoFailed));
        return;
      }

      final peak = state.peak;
      final peakCoordinates = peak.coordinates;
      final isValid = AppGeolocator.isWithinRange(
        longitude1: peakCoordinates.longitude,
        latitude1: peakCoordinates.latitude,
        longitude2: imageCoordinates.longitude,
        latitude2: imageCoordinates.latitude,
      );

      if (!isValid) {
        emit(state.copyWith(status: PeakChipStateStatus.validatingMemorablePhotoFailed));
        return;
      }

      emit(state.copyWith(status: PeakChipStateStatus.validatingMemorablePhotoSucceeded));
      add(SaveMemorablePhoto(image));
    } catch (error, stacktrace) {
      AppLogger.error('FAILED TO VALIDATE IMAGE LOCATION error: $error, stacktrace: $stacktrace');
      emit(state.copyWith(status: PeakChipStateStatus.validatingMemorablePhotoFailed, error: error.toString()));
    }
  }

  Future<void> _onSaveMemorablePhoto(SaveMemorablePhoto event, Emitter<PeakChipState> emit) async {
    try {
      emit(state.copyWith(status: PeakChipStateStatus.savingMemorablePhoto));
      final image = event.image;
      final imageCreatedAt = await ImageExif.getImageDateTime(image);
      final compressedImageBytes = await ImageCompressor.compressFile(image);
      final peak = state.peak;
      final peakId = peak.id;
      await _storageRepository.savePeakImage(bytes: compressedImageBytes, peakId: peakId);
      emit(state.copyWith(status: PeakChipStateStatus.savingMemorablePhotoSucceeded));
      add(MarkPeakAsConquered(imageCreatedAt));
    } catch (error, stacktrace) {
      AppLogger.error('FAILED TO MARK PEAK AS CONQUERED error: $error, stacktrace: $stacktrace');
      emit(state.copyWith(status: PeakChipStateStatus.savingMemorablePhotoFailed, error: error.toString()));
    }
  }

  Future<void> _onMarkPeakAsConquered(MarkPeakAsConquered event, Emitter<PeakChipState> emit) async {
    try {
      emit(state.copyWith(status: PeakChipStateStatus.insertingMetadata));
      final peak = state.peak;
      final peakId = peak.id;
      final metadata = await _userMetadataRepository.insert(peakId: peakId, conqueredDate: event.imageCreatedAt);
      emit(
        state.copyWith(
          status: PeakChipStateStatus.insertingMetadataSucceeded,
          peak: peak.updateUserMetadata(metadata),
        ),
      );
    } catch (error, stacktrace) {
      AppLogger.error('FAILED TO MARK PEAK AS CONQUERED error: $error, stacktrace: $stacktrace');
      emit(state.copyWith(status: PeakChipStateStatus.insertingMetadataFailed, error: error.toString()));
    }
  }
}
