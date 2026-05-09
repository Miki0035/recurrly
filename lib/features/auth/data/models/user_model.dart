import 'package:recurrly/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.id, required super.email, required super.username});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(id: map['id'], email: map['email'], username: map['name']);
  }
}
