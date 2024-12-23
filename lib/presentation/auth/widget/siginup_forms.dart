import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constant/constant.dart';
import 'package:flutter_application_1/data/auth/models/user_creational_req.dart';
import 'package:flutter_application_1/presentation/auth/widget/email_text_field.dart';
import 'package:flutter_application_1/presentation/auth/widget/password_text_field.dart';
import 'package:flutter_application_1/presentation/auth/widget/user_name_text_fileld.dart';
import 'package:dartz/dartz.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({
    super.key,
    required this.formKey,
  });

    final GlobalKey<FormState> formKey;
    UserCreationalReq _userCreationalReq = UserCreationalReq(email: '', password: '', userName: '');

  Either<String, UserCreationalReq> getReq() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      return Right(_userCreationalReq);
    } else {
      return const Left("the value is not valid");
    }
  }

  void saveEmail(String? email) {
  _userCreationalReq.email = email!;
  }  

  void saveUserName(String? userName) {
    _userCreationalReq.userName = userName!;
  }

  void savePassword(String? password) {
    _userCreationalReq.password = password!;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [ 
          UserNameTextFileld(onSavedFunction: saveUserName),
          const SizedBox(height: defaultPadding),
          EmailTextField(onSavedFunction: saveEmail),
          const SizedBox(height: defaultPadding),
          PasswordTextField(onSavedFunction: savePassword,)
        ],
      ),
    );
  }
}