import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constant/constant.dart';
import 'package:flutter_application_1/data/auth/models/user_signin_req.dart';
import 'package:flutter_application_1/presentation/auth/widget/email_text_field.dart';
import 'package:flutter_application_1/presentation/auth/widget/password_text_field.dart';
import 'package:dartz/dartz.dart';

class LogInForm extends StatelessWidget{
  LogInForm({
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  UserSigninReq _userSigninReq = UserSigninReq(email: '', password: '');

  Either<String, UserSigninReq> getReq() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      return Right(_userSigninReq);
    } else {
      return const Left("the value is not valid");
    }
  }

  void saveEmail(String? email) {
    _userSigninReq.email = email!;
  }

  void savePassword(String? password) {
    _userSigninReq.password = password!;
  }

  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          EmailTextField(onSavedFunction: saveEmail),
          const SizedBox(height: defaultPadding),
          PasswordTextField(onSavedFunction: savePassword,)
        ],
      ),
    );
  }
}
