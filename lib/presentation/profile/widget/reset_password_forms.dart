import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/auth/models/reset_password_py_old_password_req.dart';
import '../../../core/constant/constant.dart';
import '../../auth/widget/password_text_field.dart';
import 'package:dartz/dartz.dart';

class ResetPasswordForms extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  ResetPasswordForms({super.key, required this.formKey});

  String? oldPassword = "";
  String? newPassword = "";
  String? newPasswordConfig = "";

  Either getResetPasswordReq() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      if (newPassword == newPasswordConfig) {
        return Right(ResetPasswordPyOldPasswordReq(newPassword: newPassword!,oldPassword: oldPassword!));
      } else {
        return const Left("not equal");
      }
    } else {
      return const Left("not valid");
    }
  }

  void savePassword(String? password) {
    newPassword = password;
  }

  void savePasswordConfig(String? password) {
    newPasswordConfig = password;
  }

  void saveOldPassword(String? password) {
    oldPassword = password;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          PasswordTextField(
            onSavedFunction: (value) => saveOldPassword(value),
            hintText: "Old password",
          ),
          const SizedBox(height: defaultPadding),
          PasswordTextField(
            onSavedFunction: (value) => savePassword(value),
            hintText: "New password",
          ),
          const SizedBox(height: defaultPadding),
          PasswordTextField(
            onSavedFunction: (value) => savePasswordConfig(value),
            hintText: "New password agin",
          ),
        ],
      ),
    );
  }
}
