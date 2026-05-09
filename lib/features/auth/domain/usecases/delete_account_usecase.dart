import 'package:recurrly/features/auth/domain/repositories/auth_repository.dart';

class DeleteAccountUsecase {
  final AuthRepository authRepository;

  DeleteAccountUsecase(this.authRepository);

  Future<void> call({required String id}) async {
    return await authRepository.deleteAccount(id: id);
  }
}
