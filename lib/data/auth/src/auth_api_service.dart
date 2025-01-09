import "package:dartz/dartz.dart";
import "../models/set_user_info_req.dart";
import "package:http/http.dart" as http;

import "../../../core/constant/urls_constant.dart";
import "../models/confirm_verification_code_req.dart";
import "../models/reset_password_py_old_password_req.dart";
import "../models/reset_password_py_token_req.dart";
import "../models/user_creational_req.dart";
import "../models/user_signin_req.dart";

abstract class AuthApiService{
  Future<Either> signin(UserSigninReq params);
  Future<Either> signup(UserCreationalReq params);
  Future<Either> getUser(String token);
  Future<Either> resetPasswordPyToken(ResetPasswordPyTokenReq params);
  Future<Either> resetPasswordPyOldPassword(ResetPasswordPyOldPasswordReq params);
  Future<Either> confirmVerificationCode(ConfirmVerificationCodeReq params);
  Future<Either> sentVerificationCode(String email);
  Future<Either> setUserInfo(SetUserInfoReq userInfo);
}

class AuthApiServiceImp extends AuthApiService{
  @override
  Future<Either> getUser(String token) async{
    Uri url = Uri.parse(UrlsConstant.getUser);

    await Future.delayed(const Duration(seconds: 2));

    return const Left("UnimplementedError");

  }

  @override
  Future<Either> signin(UserSigninReq params) async{
    Uri url = Uri.parse(UrlsConstant.login);

    await Future.delayed(Duration(seconds: 2));
    return Left("eeee");


    try{
      http.Response response =  await http.post(url,body: params.toMap());
      if(response.statusCode != 200){
        return const Left("wrong email or password");
      }

      return Right(response);

    }catch(error){
      return const Left("network erorruuuuuu");
    }

  }

  @override
  Future<Either> signup(UserCreationalReq params) async{
    Uri url = Uri.parse(UrlsConstant.signup);


    try{
      http.Response response =  await http.post(url,body: params.toMap());
      if(response.statusCode != 200){

      return const Left("Wrong value");
      }

      return Right(response);

    } catch(error){
      return const Left("network erorr");
    }
  }
  
  @override
  Future<Either> confirmVerificationCode(ConfirmVerificationCodeReq params) async{ //should return the token
    Uri url = Uri.parse(UrlsConstant.confirmVerificationCode);

    await Future.delayed(const Duration(seconds: 2));
    return const Right("UnimplementedError");
  }
  
  @override
  Future<Either> sentVerificationCode(String email) async{
    Uri url = Uri.parse(UrlsConstant.sendVerificationCode);

    await Future.delayed(const Duration(seconds: 2));
    return const Right("UnimplementedError");
  }
  
  @override
  Future<Either> resetPasswordPyToken(ResetPasswordPyTokenReq params) async{
    Uri url = Uri.parse(UrlsConstant.resetPassword);

    await Future.delayed(const Duration(seconds: 2));

    return const Left("UnimplementedError");
  }
  
  @override
  Future<Either> resetPasswordPyOldPassword(ResetPasswordPyOldPasswordReq params) {
    // TODO: implement resetPasswordPyOldPassword
    throw UnimplementedError();
  }
  
  @override
  Future<Either> setUserInfo(SetUserInfoReq userInfo) {
    // TODO: implement setUserInfo
    throw UnimplementedError();
  }

}