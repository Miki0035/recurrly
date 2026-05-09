import 'package:recurrly/features/auth/domain/entities/user_entity.dart';

// defines what the auth layer can do
abstract class AuthRepository {
  Future<UserEntity> login({required String email, required String password});
  Future<UserEntity> createAccount({
    required String email,
    required String password,
    required String username,
  });

  Future<void> logout();
  Future<void> deleteAccount({required String id});
}
