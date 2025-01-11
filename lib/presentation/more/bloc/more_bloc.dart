import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:eksiazeczka_kgp/data/enums/enums.dart';
import 'package:eksiazeczka_kgp/data/repositories/repositories.dart';
import 'package:eksiazeczka_kgp/presentation/more/constants/more_state_status.dart';
import 'package:eksiazeczka_kgp/services/services.dart';
import 'package:eksiazeczka_kgp/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'more_event.dart';
part 'more_state.dart';

class MoreBloc extends Bloc<MoreEvent, MoreState> {
  MoreBloc({required AuthService authService, required SupabaseStorageRepository supabaseStorageRepository})
      : _authService = authService,
        _supabaseStorageRepository = supabaseStorageRepository,
        super(const MoreState()) {
    on<_UserUpdate>(_onUserUpdate);
    on<SignInWithProvider>(_onSignInWithProvider);
    on<UpdateProfilePicture>(onUpdateProfilePicture);
    on<OpenLink>(_onOpenLink);

    _authService.getCurrentUser().then((user) {
      add(_UserUpdate(user));
    }).whenComplete(() {
      _userSubscription = _authService.user.listen(
        (user) {
          if (user != null) add(_UserUpdate(user));
        },
      );
    });
  }

  final AuthService _authService;
  final SupabaseStorageRepository _supabaseStorageRepository;
  late StreamSubscription<User?> _userSubscription;

  Future<void> _onUserUpdate(_UserUpdate event, Emitter<MoreState> emit) async {
    emit(state.copyWith(user: event.user, error: state.error));
  }

  Future<void> _onSignInWithProvider(SignInWithProvider event, Emitter<MoreState> emit) async {
    emit(state.copyWith(status: MoreStateStatus.signingIn));
    final provider = event.provider;
    await _authService.signInWithProvider(provider).then((_) async {
      emit(state.copyWith(status: MoreStateStatus.signingInSucceeded));
    }).catchError((Object error, StackTrace stacktrace) async {
      log('FAILED TO SIGN IN WITH ${provider.name.toUpperCase()}, error: $error \n\n $stacktrace');
      emit(state.copyWith(status: MoreStateStatus.signingInFailed, error: error.toString()));
    });
  }

  Future<void> onUpdateProfilePicture(UpdateProfilePicture event, Emitter<MoreState> emit) async {
    final user = state.user;
    if (user == null) return;
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final compressedImageBytes = await ImageCompressor.compressFile(image);
    await _supabaseStorageRepository.uploadAvatar(fileBytes: compressedImageBytes, userId: user.id);
    final userAvatarUrl = await _supabaseStorageRepository.getUserAvatar(userId: user.id);
    await _authService.updateUserAvatar(userAvatarUrl);
  }

  Future<void> _onOpenLink(OpenLink event, Emitter<MoreState> emit) async {
    final url = event.url;
    await UrlLauncher.open(url);
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
