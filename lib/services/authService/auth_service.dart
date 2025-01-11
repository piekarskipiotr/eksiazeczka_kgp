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

  final _controller = StreamController<User?>.broadcast();

  Stream<User?> get user async* {
    yield* _controller.stream;
  }

  Future<void> initializeSupabaseAuthStatus() async {
    _supabaseAuthRepository.authStateChanges().listen((authState) async {
      final session = authState.session;
      await _handleStorageAuthStateChange(session);
      final user = session?.user;
      _controller.add(user);
    });
  }

  Future<void> signInWithProvider(Providers provider) async {
    switch (provider) {
      case Providers.google:
        await _supabaseAuthRepository.signInWithGoogle();
      case Providers.apple:
        await _supabaseAuthRepository.signInWithApple();
    }
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

  Future<void> updateUserAvatar(String url) => _supabaseAuthRepository.updateUserAvatar(url);

  Future<User> getCurrentUser() => _supabaseAuthRepository.getCurrentUser();

  Future<void> deleteAccount() => _supabaseAuthRepository.deleteAccount();

  Future<void> signOut() => _supabaseAuthRepository.signOut();
}
