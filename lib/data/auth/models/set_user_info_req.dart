// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:flutter_application_1/data/auth/models/user.dart';

import '../../../domain/auth/entity/gender.dart';

class SetUserInfoReq {
  File? profileImage;
  String? profileImageUrl;
  String email;
  String userName;
  GenderType gender;
  String phoneNumber;
  DateTime? birthDayDate;

  SetUserInfoReq({
    this.profileImage,
    required this.email,
    required this.userName,
    required this.gender,
    this.birthDayDate,
    required this.phoneNumber,
  });

  void setProfileImageUrl(String profileImageUrl) {
    this.profileImageUrl = profileImageUrl;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> returnedMap = {
      'email': email,
      'userName': userName,
      'gender': gender.toShortString(),
      'phoneNumber': phoneNumber,
    };

    profileImageUrl != null
        ? returnedMap["profileImageUrl"] = profileImageUrl
        : null;
    birthDayDate != null ? returnedMap["birthDayDate"] = birthDayDate!.toIso8601String() : null;

    return returnedMap;
  }
}
