import "package:dartz/dartz.dart";
import "package:flutter_application_1/core/error/failures.dart";
import "package:flutter_application_1/domain/auth/entity/user_entity.dart";
import "../../../data/auth/models/set_user_info_req.dart";
import "../../../data/auth/models/reset_password_py_old_password_req.dart";
import "../../../data/auth/models/user_creational_req.dart";
import "../../../data/auth/models/user_signin_req.dart";

abstract class AuthRepository {
  Future<Either<Failure,void>> signin(UserSigninReq params);
  Future<Either<Failure,void>> signup(UserCreationalReq params);
  Future<Either<Failure,void>> logOut();
  Future<bool> isLoggedIn();
  Future<Either<Failure,UserEntity>> getUser();
  Future<Either<Failure,void>> sendPasswordResetEmail(String email);
  Future<Either<Failure,void>> resetPasswordPyOldPassword(ResetPasswordPyOldPasswordReq params);
  Future<Either<Failure,void>> setUserInfo(SetUserInfoReq userInfo);
}
