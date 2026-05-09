import 'package:recurrly/features/auth/domain/entities/user_entity.dart';
import 'package:recurrly/features/auth/domain/repositories/auth_repository.dart';

class CreateAccountUsecase {
  final AuthRepository authRepository;

  CreateAccountUsecase(this.authRepository);

  // this is where business  rules goes
  // like validation , login conditions, checking permissions

  Future<UserEntity> call({
    required String email,
    required String password,
    required String username,
  }) async {
    if (email.isEmpty || password.isEmpty || username.isEmpty) {
      throw Exception("Missing credentials");
    }
    // at runtime authRepositryImpl is the actual object created and used
    // so u don't have to call authRepositoryImpl() here
    return await authRepository.createAccount(
      email: email,
      password: password,
      username: username,
    );
  }
}
