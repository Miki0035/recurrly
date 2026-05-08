import 'package:recurrly/core/common/auth_result.dart';
import 'package:recurrly/features/auth/domain/entities/user_entity.dart';
import 'package:recurrly/features/auth/domain/usecases/login_usecase.dart';

class AuthController {
  final LoginUsecase loginUsecase;

  AuthController(this.loginUsecase);

  Future<AuthResult<UserEntity>> login(String email, String password) async {
    try {
      final user = await loginUsecase(email, password);
      return AuthResult.success(user);
    } catch (e) {
      return AuthResult.failure("Login Failed");
    }
  }
}
