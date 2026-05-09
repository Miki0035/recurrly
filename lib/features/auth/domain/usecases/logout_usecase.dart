import 'package:recurrly/features/auth/domain/repositories/auth_repository.dart';

class LogoutUsecase {
  final AuthRepository authRepository;
  LogoutUsecase(this.authRepository);

  Future<void> call() async {
    await authRepository.logout();
  }
}
