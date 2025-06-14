// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'gender.dart';

class UserEntity {
  String profileImage;
  String email;
  String userName;
  bool isPro;
  GenderType gender;
  String? phoneNumber;
  DateTime? birthDate;

  UserEntity({
    required this.isPro,
    required this.profileImage,
    required this.email,
    required this.userName,
    required this.birthDate,
    required this.gender,
    required this.phoneNumber
  });

  UserEntity copyWith(user, {
    String? profileImage,
    String? email,
    String? userName,
    bool? isPro,
    GenderType? gender,
    String? phoneNumber,
    DateTime? birthDate,
  }) {
    return UserEntity(
      profileImage: profileImage ?? this.profileImage,
      email: email ?? this.email,
      userName: userName ?? this.userName,
      isPro: isPro ?? this.isPro,
      gender: gender ?? this.gender,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      birthDate: birthDate ?? this.birthDate,
    );
  }
}
