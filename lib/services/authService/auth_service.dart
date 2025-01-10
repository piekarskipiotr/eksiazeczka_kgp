import 'dart:async';
import 'dart:convert';

import 'package:eksiazeczka_kgp/data/enums/enums.dart';
import 'package:eksiazeczka_kgp/data/repositories/repositories.dart';
import 'package:eksiazeczka_kgp/services/authService/auth_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  AuthService(this._authStorage, this._supabaseAuthRepository) {
    _restoreOrCreateAnonymousSession().whenComplete(initializeSupabaseAuthStatus);
  }

  final AuthStorage _authStorage;
  final SupabaseAuthRepository _supabaseAuthRepository;

  final _controller = StreamController<AuthenticationStatus>.broadcast();

  Stream<AuthenticationStatus> get status async* {
    yield* _controller.stream;
  }

  Future<void> initializeSupabaseAuthStatus() async {
    _supabaseAuthRepository.authStateChanges().listen((authState) async {
      final session = authState.session;
      await _handleStorageAuthStateChange(session);
      final status = session != null ? AuthenticationStatus.authenticated : AuthenticationStatus.unauthenticated;
      _controller.add(status);
    });
  }

  Future<void> _restoreOrCreateAnonymousSession() async {
    final session = await _authStorage.readSecureData(AuthStorage.supabaseSessionKey);
    if (session != null) {
      await _supabaseAuthRepository.setSession(session);
      return;
    }

    await _supabaseAuthRepository.signInAnonymously();
  }

  Future<void> _handleStorageAuthStateChange(Session? session) async {
    if (session != null) {
      final sessionJsonString = jsonEncode(session.toJson());
      await _authStorage.writeSecureData(AuthStorage.supabaseSessionKey, sessionJsonString);
    } else {
      await _authStorage.deleteSecureData(AuthStorage.supabaseSessionKey);
    }
  }

  Future<User> getCurrentUser() => _supabaseAuthRepository.getCurrentUser();
}
