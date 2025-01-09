import '../../../domain/auth/entity/gender.dart';
import '../../../domain/auth/entity/user_entity.dart';


/*{ "id": "1", "name": "John Doe", "gender": 0, "birthDate": "1990-01-01T00:00:00.000Z" (iso 8601)}  toIso8601String*/


class UserModel {
  String profileImage;
  String email;
  String userName;
  bool isPro;
  GenderType gender;
  String phoneNumber;
  DateTime birthDate;

  UserModel({
    required this.profileImage,
    required this.email,
    required this.userName,
    required this.isPro,
    required this.gender,
    required this.birthDate,
    required this.phoneNumber,
    });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      birthDate: DateTime.parse(map["birthDate"]),
      gender: GenderType.values[map['gender']],
      phoneNumber: map["phoneNumber"],
      isPro: map["isPro"],
      profileImage: map["profileImage"],
      email: map['email'] as String,
      userName: map['userName'] as String,
    );
  }  
}

extension UserXModel on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      gender: gender,
      phoneNumber: phoneNumber,
      birthDate: birthDate,
      isPro: isPro,
      profileImage:profileImage,
      email: email,
      userName: userName,
    );
  }
}