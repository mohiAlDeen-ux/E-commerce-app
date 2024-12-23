import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/data/auth/models/confirm_verification_code_req.dart';
import 'package:flutter_application_1/data/auth/models/reset_password_py_old_password_req.dart';
import 'package:flutter_application_1/data/auth/models/reset_password_py_token_req.dart';
import 'package:flutter_application_1/data/auth/models/user.dart';
import 'package:flutter_application_1/data/auth/models/user_creational_req.dart';
import 'package:flutter_application_1/data/auth/models/user_signin_req.dart';
import 'package:flutter_application_1/domain/auth/repository/auth.dart';
import 'package:flutter_application_1/servise_locator.dart';
import '../src/auth_api_service.dart';
import '../src/auth_local_service.dart';

class AuthRepositoryImp extends AuthRepository {
  UserModel? user;

  @override
  Future<Either> getUser(String token) async{
    if(user != null){
      return Right(user);
    }
    return (await getIt.call<AuthApiService>().getUser(token)).fold((error){
      return Left(error);
    }, (returndUser){
      user = returndUser;
      return returndUser;
    });
  }

  @override
  Future<bool> isLoggedIn() async {
    return await getIt.call<AuthLocalService>().isSavedToken();
  }

  @override
  Future<Either> signin(UserSigninReq params) async {
    final _token = await getIt.call<AuthApiService>().signin(params);

    return _token.fold((error) {
      return Left(error);
    }, (token) {
      getIt.call<AuthLocalService>().saveToken(token);
      return Right(_token);
    });
  }

  @override
  Future<Either> signup(UserCreationalReq params) async{
    final _token = await getIt.call<AuthApiService>().signup(params);

    return _token.fold((error) {
      return Left(error);
    }, (token) {
      getIt.call<AuthLocalService>().saveToken(token);
      return Right(_token);
    });
  }


  @override
  Future<Either> confirmVerificationCode(ConfirmVerificationCodeReq params) async{
    return await getIt.call<AuthApiService>().confirmVerificationCode(params);
  }

  @override
  Future<Either> sentVerificationCode(String email) async{
    return await getIt.call<AuthApiService>().sentVerificationCode(email);
  }
  
  @override
  Future<Either> logOut() async{
    user = null;
    return await getIt.call<AuthLocalService>().removeToken();
    
  }

  @override
  Future<Either> resetPasswordPyOldPassword(ResetPasswordPyOldPasswordReq params) async{
    return await getIt.call<AuthRepository>().resetPasswordPyOldPassword(params);
  }

  @override
  Future<Either> resetPasswordPyToken(ResetPasswordPyTokenReq params) async{
    return await getIt.call<AuthApiService>().resetPasswordPyToken(params);
  }
}
