import 'package:flutter_application_1/domain/auth/entity/user_entity.dart';

class UserModel {
  String email;
  String userName;

  UserModel({required this.email, required this.userName});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] as String,
      userName: map['userName'] as String,
    );
  }  
}

extension UserXModel on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      email: email,
      userName: userName,
    );
  }
}