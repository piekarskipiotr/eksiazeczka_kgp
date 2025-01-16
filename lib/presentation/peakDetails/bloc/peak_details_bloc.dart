import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:eksiazeczka_kgp/data/models/models.dart';
import 'package:eksiazeczka_kgp/data/repositories/repositories.dart';
import 'package:eksiazeczka_kgp/presentation/peakDetails/constants/peak_details_state_status.dart';
import 'package:eksiazeczka_kgp/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

part 'peak_details_event.dart';
part 'peak_details_state.dart';

class PeakDetailsBloc extends Bloc<PeakDetailsEvent, PeakDetailsState> {
  PeakDetailsBloc({
    required Peak peak,
    required UserMetadataRepository userMetadataRepository,
    required StorageRepository storageRepository,
  })  :
        _userMetadataRepository = userMetadataRepository,
        _storageRepository = storageRepository,
        super(PeakDetailsState(peak: peak)) {
    on<ValidateUserLocation>(_onValidateUserLocation);
    on<TakePhoto>(_onTakePhoto);
    on<AddFromGallery>(_onAddFromGallery);
    on<MarkPeakAsConquered>(_onMarkPeakAsConquered);
  }

  final UserMetadataRepository _userMetadataRepository;
  final StorageRepository _storageRepository;

  Future<void> _onValidateUserLocation(ValidateUserLocation event, Emitter<PeakDetailsState> emit) async {
    try {
      emit(state.copyWith(status: PeakDetailsStateStatus.validatingLocation));
      final peak = state.peak;
      final peakCoordinates = peak.coordinates;
      final geolocatorStatus = await AppGeolocator.checkPermissionStatus(
        onDenied: () {
          emit(state.copyWith(status: PeakDetailsStateStatus.validatingLocationPermissionsDenied));
        },
        onPermanentlyDenied: () {
          emit(state.copyWith(status: PeakDetailsStateStatus.validatingLocationPermissionsPermanentlyDenied));
        },
      );

      if (geolocatorStatus == false) return;

      final currentUserCoordinates = await AppGeolocator.currentLocation;
      final isValid = AppGeolocator.isWithinRange(
        longitude1: peakCoordinates.longitude,
        latitude1: peakCoordinates.latitude,
        longitude2: currentUserCoordinates.longitude,
        latitude2: currentUserCoordinates.latitude,
        range: 100,
      );

      emit(
        state.copyWith(
          status: isValid
              ? PeakDetailsStateStatus.validatingLocationSucceeded
              : PeakDetailsStateStatus.validatingLocationFailed,
        ),
      );
    } catch (error, stacktrace) {
      log('FAILED TO VALIDATE USER LOCATION error: $error, stacktrace: $stacktrace');
      emit(state.copyWith(error: error.toString()));
    }
  }

  Future<void> _onTakePhoto(TakePhoto event, Emitter<PeakDetailsState> emit) async {
    try {
      emit(state.copyWith(status: PeakDetailsStateStatus.initial));
      final isPermissionGranted = await PermissionsHelper.checkPermissionStatus(
        permission: Permission.camera,
        onPermanentlyDenied: () {
          emit(state.copyWith(status: PeakDetailsStateStatus.takingPhotoPermissionsPermanentlyDenied));
        },
      );

      if (!isPermissionGranted) return;
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;

      emit(state.copyWith(status: PeakDetailsStateStatus.takingPhoto));
      final compressedImageBytes = await ImageCompressor.compressFile(image);
      final peak = state.peak;
      final peakId = peak.id;
      await _storageRepository.savePeakImage(bytes: compressedImageBytes, peakId: peakId);

      emit(state.copyWith(status: PeakDetailsStateStatus.takingPhotoSucceeded));
    } catch (error, stacktrace) {
      log('FAILED TO TAKE PHOTO error: $error, stacktrace: $stacktrace');
      emit(state.copyWith(status: PeakDetailsStateStatus.addingGalleryPhotoFailed, error: error.toString()));
    }
  }

  Future<void> _onAddFromGallery(AddFromGallery event, Emitter<PeakDetailsState> emit) async {
    try {
      emit(state.copyWith(status: PeakDetailsStateStatus.initial));
      final isPermissionGranted = await PermissionsHelper.checkPermissionStatus(
        permission: Permission.photos,
        onPermanentlyDenied: () {
          emit(state.copyWith(status: PeakDetailsStateStatus.addingGalleryPhotoPermissionsPermanentlyDenied));
        },
      );

      if (!isPermissionGranted) return;
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      emit(state.copyWith(status: PeakDetailsStateStatus.addingGalleryPhoto));
      final compressedImageBytes = await ImageCompressor.compressFile(image);
      final peak = state.peak;
      final peakId = peak.id;
      await _storageRepository.savePeakImage(bytes: compressedImageBytes, peakId: peakId);

      emit(state.copyWith(status: PeakDetailsStateStatus.addingGalleryPhotoSucceeded));
    } catch (error, stacktrace) {
      log('FAILED TO ADD PHOTO FROM GALLERY error: $error, stacktrace: $stacktrace');
      emit(state.copyWith(status: PeakDetailsStateStatus.addingGalleryPhotoFailed, error: error.toString()));
    }
  }

  Future<void> _onMarkPeakAsConquered(MarkPeakAsConquered event, Emitter<PeakDetailsState> emit) async {
    try {
      emit(state.copyWith(status: PeakDetailsStateStatus.insertingMetadata));
      final peak = state.peak;
      final peakId = peak.id;
      final metadata = await _userMetadataRepository.insert(peakId: peakId);

      emit(
        state.copyWith(
          status: PeakDetailsStateStatus.insertingMetadataSucceeded,
          peak: peak.updateUserMetadata(metadata),
        ),
      );
    } catch (error, stacktrace) {
      log('FAILED TO MARK PEAK AS CONQUERED error: $error, stacktrace: $stacktrace');
      emit(state.copyWith(status: PeakDetailsStateStatus.insertingMetadataFailed, error: error.toString()));
    }
  }
}
