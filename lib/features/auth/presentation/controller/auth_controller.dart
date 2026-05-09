import 'package:recurrly/core/common/auth_result.dart';
import 'package:recurrly/features/auth/domain/entities/user_entity.dart';
import 'package:recurrly/features/auth/domain/usecases/create_account_usecase.dart';
import 'package:recurrly/features/auth/domain/usecases/delete_account_usecase.dart';
import 'package:recurrly/features/auth/domain/usecases/login_usecase.dart';
import 'package:recurrly/features/auth/domain/usecases/logout_usecase.dart';

class AuthController {
  final LoginUsecase loginUsecase;
  final CreateAccountUsecase createAccountUsecase;
  final LogoutUsecase logoutUsecase;
  final DeleteAccountUsecase deleteAccountUsecase;

  AuthController(
    this.loginUsecase,
    this.createAccountUsecase,
    this.logoutUsecase,
    this.deleteAccountUsecase,
  );

  Future<AuthResult<UserEntity>> login(String email, String password) async {
    try {
      final user = await loginUsecase(email, password);
      return AuthResult.success(user);
    } catch (e) {
      return AuthResult.failure("Login Failed");
    }
  }

  Future<AuthResult<UserEntity>> createAccount({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      final user = await createAccountUsecase(
        email: email,
        password: password,
        username: username,
      );
      return AuthResult.success(user);
    } catch (e) {
      return AuthResult.failure("Failed to create account");
    }
  }

  Future<AuthResult<bool>> logout() async {
    try {
      await logoutUsecase();
      return AuthResult.success(true);
    } catch (e) {
      return AuthResult.failure("Failed to logout user");
    }
  }

  Future<AuthResult<bool>> deleteAccount({required String userId}) async {
    try {
      await deleteAccountUsecase(id: userId);
      return AuthResult.success(true);
    } catch (e) {
      return AuthResult.failure("Failed to delete account");
    }
  }
}
