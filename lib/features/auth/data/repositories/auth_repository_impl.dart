import 'package:recurrly/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:recurrly/features/auth/domain/entities/user_entity.dart';
import 'package:recurrly/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource authRemoteDataSource;

  AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<UserEntity> login({
    required String email,
    required String password,
  }) async {
    final user = await authRemoteDataSource.login(
      email: email,
      password: password,
    );
    return user;
  }

  @override
  Future<UserEntity> createAccount({
    required String email,
    required String password,
    required String username,
  }) async {
    final user = await authRemoteDataSource.createAccount(
      email: email,
      password: password,
      username: username,
    );
    return user;
  }
}
