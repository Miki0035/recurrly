import 'package:recurrly/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:recurrly/features/auth/domain/entities/user_entity.dart';
import 'package:recurrly/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource authRemoteDataSource;

  AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<UserEntity> login(String email, String password) async {
    final user = await authRemoteDataSource.login(email, password);
    return user;
  }
}
