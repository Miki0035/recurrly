import 'package:recurrly/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.id, required super.email, required super.name});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(id: map['id'], email: map['email'], name: map['name']);
  }
}
