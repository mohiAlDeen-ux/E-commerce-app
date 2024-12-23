import "package:dartz/dartz.dart";
import "package:flutter_application_1/data/auth/models/confirm_verification_code_req.dart";
import "package:flutter_application_1/data/auth/models/reset_password_py_old_password_req.dart";
import "package:flutter_application_1/data/auth/models/reset_password_py_token_req.dart";
import "package:flutter_application_1/data/auth/models/user_creational_req.dart";
import "package:flutter_application_1/data/auth/models/user_signin_req.dart";

abstract class AuthRepository{
  Future<Either> signin(UserSigninReq params);
  Future<Either> signup(UserCreationalReq params);
  Future<Either> logOut();
  Future<bool> isLoggedIn();
  Future<Either> getUser(String token);
  Future<Either> resetPasswordPyToken(ResetPasswordPyTokenReq params);
  Future<Either> resetPasswordPyOldPassword(ResetPasswordPyOldPasswordReq params);
  Future<Either> confirmVerificationCode(ConfirmVerificationCodeReq params);
  Future<Either> sentVerificationCode(String email);

}