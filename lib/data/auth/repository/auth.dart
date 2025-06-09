import 'package:dartz/dartz.dart';

import '../../../domain/auth/entity/gender.dart';
import '../../../domain/auth/repository/auth.dart';
import '../../../servise_locator.dart';
import '../models/confirm_verification_code_req.dart';
import '../models/reset_password_py_old_password_req.dart';
import '../models/reset_password_py_token_req.dart';
import '../models/set_user_info_req.dart';
import '../models/user.dart';
import '../models/user_creational_req.dart';
import '../models/user_signin_req.dart';
import '../src/auth_api_service.dart';
import '../src/auth_local_service.dart';

class AuthRepositoryImp extends AuthRepository {
  UserModel? user = UserModel(
    profileImage: "https://i.imgur.com/IXnwbLk.png",
    email: "mohamedali@gmail.com",
    userName: "Mohamed Ali",
    isPro: true,
    birthDate: DateTime.now(),
    gender: GenderType.male,
    phoneNumber: "+1234567890"
    );

  @override
  Future<Either> getUser() async{
    await Future.delayed(const Duration(seconds: 5));
    if(user != null){
      return Right(user!.toEntity());
    }
    Either token = await getIt.call<AuthLocalService>().getToken();
    return token.fold((error){
      return Left(error);
    }, (returnedToken) async{
      return (await getIt.call<AuthApiService>().getUser(returnedToken)).fold((error){
      return Left(error);
    }, (returndUser){
      user = returndUser;
      return Right(user!.toEntity());
    });
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

  @override
  Future<Either> setUserInfo(SetUserInfoReq userInfo) async{
    await Future.delayed(const Duration(seconds: 5));
    return const Right("error in server");
   return await getIt.call<AuthApiService>().setUserInfo(userInfo);
  }
}
