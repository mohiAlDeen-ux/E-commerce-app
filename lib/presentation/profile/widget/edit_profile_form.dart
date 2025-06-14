import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/bloc/task/task_state.dart';
import '../../../core/constant/constant.dart';
import '../../../data/auth/models/set_user_info_req.dart';
import '../../../domain/auth/entity/gender.dart';
import '../../../domain/auth/entity/user_entity.dart';
import '../bloc/user_cubit.dart';
import 'birth_day_date_filed.dart';
import 'email_text_filed.dart';
import 'gender_option_filed.dart';
import 'phone_number_text_filed.dart';
import 'user_name_text_filed.dart';

class EditProfileForm extends StatelessWidget {
  EditProfileForm({
    super.key,
    required this.formKey,
  });

    final GlobalKey<FormState> formKey;
    late SetUserInfoReq _setUserIntoReq;

  Either<String, SetUserInfoReq> getReq() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      return Right(_setUserIntoReq);
    } else {
      return const Left("the value is not valid");
    }
  }

  void saveUserName(String? userName) {
    _setUserIntoReq.userName = userName!;
  }

  void saveEmail(String? email) {
  _setUserIntoReq.email = email!;
  }  

  void saveGender(GenderType? gender) {
    _setUserIntoReq.gender = gender!;
  }

  void saveBirthDayDate(DateTime? birthDayDate) {
    _setUserIntoReq.birthDayDate = birthDayDate!;
  }

  void savePhoneNumber(String? phoneNumber) {
    _setUserIntoReq.phoneNumber = phoneNumber!;
  }

  @override
  Widget build(BuildContext context) {
    final userState = context.watch<UserCubit>().state;
    if(userState is SuccessState){
      UserEntity userEntity = userState.data;
      _setUserIntoReq = SetUserInfoReq(email: '', userName: '', gender: userEntity.gender, phoneNumber: '', birthDayDate: userEntity.birthDate, profileImage: null);

    return Form(
      key: formKey,
      child: Column(
        children: [ 
          UserNameTextFileld(onSavedFunction: saveUserName,initialValue: userEntity.userName,),
          const SizedBox(height: defaultPadding),
          EmailTextField(onSavedFunction: saveEmail, initialValue: userEntity.email,),
          const SizedBox(height: defaultPadding),
          GenderOptionFiled(onSavedFunction: saveGender,initialValue:userEntity.gender),
          const SizedBox(height: defaultPadding,),
          BirthDayDateFiled(onSavedFunction: saveBirthDayDate ,initialDate: userEntity.birthDate,),
          const SizedBox(height: defaultPadding,),
          PhoneNumberTextFiled(initialPhoneNumber: userEntity.phoneNumber,onSavedFunction: savePhoneNumber,)
        ],
      ),
    );
    }else{
      return CircularProgressIndicator();
    }
  }
}