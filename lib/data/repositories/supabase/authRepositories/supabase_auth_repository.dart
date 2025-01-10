import 'dart:convert';

import 'package:eksiazeczka_kgp/services/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthRepository {
  SupabaseAuthRepository(this._authStorage);

  final AuthStorage _authStorage;
  final _instance = Supabase.instance.client.auth;
  final _functionsInstance = Supabase.instance.client.functions;

  Stream<AuthState> authStateChanges() {
    return _instance.onAuthStateChange;
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

  Future<User> updateUserAvatar(String url) async {
    try {
      final response = await _instance.updateUser(UserAttributes(data: {'avatar': url}));
      final user = response.user;
      if (user == null) throw Exception('No user returned');

      return user;
    } catch (e) {
      throw Exception(e);
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
