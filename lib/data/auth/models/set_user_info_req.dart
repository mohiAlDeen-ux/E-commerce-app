import 'dart:io';

import '../../../domain/auth/entity/gender.dart';

class SetUserInfoReq{
  File? profileImage;
  String email;
  String userName;
  GenderType gender;
  String phoneNumber;
  DateTime birthDayDate;

  SetUserInfoReq({
    required this.profileImage,
    required this.email,
    required this.userName,
    required this.gender,
    required this.birthDayDate,
    required this.phoneNumber,
    });

}