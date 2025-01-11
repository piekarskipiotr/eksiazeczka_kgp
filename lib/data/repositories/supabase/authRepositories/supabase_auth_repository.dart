import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:eksiazeczka_kgp/data/constants.dart';
import 'package:eksiazeczka_kgp/services/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthRepository {
  SupabaseAuthRepository(this._authStorage);

  final AuthStorage _authStorage;
  final _instance = Supabase.instance.client.auth;
  final _functionsInstance = Supabase.instance.client.functions;

  Stream<AuthState> authStateChanges() {
    return _instance.onAuthStateChange;
  }

  Future<void> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn(serverClientId: webClientId).signIn();
      final googleAuth = await googleUser!.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      if (accessToken == null) throw const AuthException('No Access Token found.');
      if (idToken == null) throw const AuthException('No ID Token found.');

      await _instance.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> signInWithApple() async {
    try {
      final rawNonce = _instance.generateRawNonce();
      final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();

      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [AppleIDAuthorizationScopes.email],
        nonce: hashedNonce,
      );

      final idToken = credential.identityToken;
      if (idToken == null) throw const AuthException('Could not find ID Token from generated credential.');

      await _instance.signInWithIdToken(
        provider: OAuthProvider.apple,
        idToken: idToken,
        nonce: rawNonce,
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> signInAnonymously() async {
    try {
      await _instance.signInAnonymously();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> setSession(String jsonStr) => _instance.setInitialSession(jsonStr);

  Future<User> getCurrentUser() async {
    try {
      final currentUser = _instance.currentUser;
      if (currentUser != null) return currentUser;

      final sessionJsonString = await _authStorage.readSecureData(AuthStorage.supabaseSessionKey);
      if (sessionJsonString == null) throw Exception('Failed to get current user');

      final sessionJson = jsonDecode(sessionJsonString) as Map<String, dynamic>;
      final session = Session.fromJson(sessionJson);
      return session!.user;
    } catch (e) {
      throw Exception('Failed to get current user');
    }
  }

  Future<void> signOut() async {
    try {
      await _instance.signOut();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> deleteAccount() async {
    try {
      final currentUser = await getCurrentUser();
      final userId = currentUser.id;
      await _functionsInstance.invoke('delete_user_account', body: {'userId': userId});
    } catch (e) {
      throw Exception(e);
    }
  }
}
