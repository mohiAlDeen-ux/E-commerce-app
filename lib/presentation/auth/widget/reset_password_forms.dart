import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constant/constant.dart';
import 'package:flutter_application_1/presentation/auth/widget/password_text_field.dart';
import 'package:dartz/dartz.dart';

class ResetPasswordForms extends StatelessWidget {
  GlobalKey<FormState> formKey;

  ResetPasswordForms({super.key, required this.formKey});

  String ? Password = "";
  String ? PasswordConfig = "";


  Either getPassword(){
      if(formKey.currentState!.validate()){
        formKey.currentState!.save();
        if(Password == PasswordConfig){
        return Right(Password) ;
        }else{
          return const Left("not equal");
        }
      }else{
        return const Left("not valid");
      }
    }

    void savePassword(String ? password){
      Password = password;
    }

    void savePasswordConfig(String ? password){
      PasswordConfig = password;
    }
  

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
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
