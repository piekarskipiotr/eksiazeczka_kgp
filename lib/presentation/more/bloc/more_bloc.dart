import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eksiazeczka_kgp/data/enums/enums.dart';
import 'package:eksiazeczka_kgp/services/services.dart';
import 'package:eksiazeczka_kgp/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'more_event.dart';
part 'more_state.dart';

class MoreBloc extends Bloc<MoreEvent, MoreState> {
  MoreBloc({required AuthService authService})
      : _authService = authService,
        super(const MoreState()) {
    on<SignInWithProvider>(_onSignInWithProvider);
    on<UpdateProfilePicture>(onUpdateProfilePicture);
    on<OpenLink>(_onOpenLink);
  }

  final AuthService _authService;

  Future<void> _onSignInWithProvider(SignInWithProvider event, Emitter<MoreState> emit) async {
    // TODO(piotr): Implement sign in functionality
  }

  Future<void> onUpdateProfilePicture(UpdateProfilePicture event, Emitter<MoreState> emit) async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    // TODO(piotr): Implement avatar change locally and online
  }

  Future<void> _onOpenLink(OpenLink event, Emitter<MoreState> emit) async {
    final url = event.url;
    await UrlLauncher.open(url);
  }
}
