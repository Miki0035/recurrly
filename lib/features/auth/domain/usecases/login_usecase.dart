import 'package:recurrly/features/auth/domain/entities/user_entity.dart';
import 'package:recurrly/features/auth/domain/repositories/auth_repository.dart';

// this is where business  rules goes
// like validation , login conditions, checking permissions

class LoginUsecase {
  final AuthRepository authRepository;

  LoginUsecase(this.authRepository);

  Future<UserEntity> call(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      throw Exception("Missing credentials");
    }
    // at runtime authRepositryImpl is the actual object created and used
    // so u don't have to call authRepositoryImpl() here
    return await authRepository.login(email: email, password: password);
  }
}
