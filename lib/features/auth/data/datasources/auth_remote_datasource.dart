import 'package:flutter/foundation.dart';
import 'package:recurrly/core/services/supabase_service.dart';
import 'package:recurrly/features/auth/data/models/user_model.dart';

// this layer only fetches data from db or backend
class AuthRemoteDatasource {
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    debugPrint('from AuthRemoteDataSource login $email , $password');
    try {
      final response = await SupabaseService.client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user == null) {
        throw Exception("Failed to login");
      }
      final user = response.user!;
      return UserModel.fromMap(user.userMetadata!);
    } catch (e) {
      debugPrint("Error from remote $e");
      throw Exception("Failed to login");
    }
  }

  Future<UserModel> createAccount({
    required String email,
    required String password,
    required String username,
  }) async {
    final response = await SupabaseService.client.auth.signUp(
      email: email,
      password: password,
      data: {"username": username},
    );

    if (response.user == null) {
      throw Exception("Failed to login");
    }
    final user = response.user!;
    return UserModel.fromMap(user.userMetadata!);
  }

  Future<void> logout() async {
    await SupabaseService.client.auth.signOut();
  }

  Future<void> deleteAccount({required String id}) async {
    try {
      debugPrint('remoteDataSource Delete $id\n');
      await SupabaseService.client.auth.admin.deleteUser(id);
    } catch (e) {
      debugPrint("Error from remote delete: $e\n");
      throw Exception("Failed to delete account\n");
    }
  }
}
