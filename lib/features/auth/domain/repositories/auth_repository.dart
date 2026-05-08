import 'package:recurrly/features/auth/domain/entities/user_entity.dart';

// defines what the auth layer can do
abstract class AuthRepository {
  Future<UserEntity> login(String email, String password);
}
