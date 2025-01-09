import 'gender.dart';

class UserEntity{
  String profileImage;
  String email;
  String userName;
  bool isPro;
  GenderType gender;
  String phoneNumber;
  DateTime birthDate;

  UserEntity({
    required this.isPro,
    required this.profileImage,
    required this.email,
    required this.userName,
    required this.birthDate,
    required this.gender,
    required this.phoneNumber
  });

}