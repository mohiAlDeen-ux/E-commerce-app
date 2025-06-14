import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/error/failures.dart';
import 'package:flutter_application_1/data/auth/src/cloudinary_server.dart';
import 'package:flutter_application_1/domain/auth/entity/user_entity.dart';

import '../../../domain/auth/repository/auth.dart';
import '../../../servise_locator.dart';
import '../models/reset_password_py_old_password_req.dart';
import '../models/set_user_info_req.dart';
import '../models/user_creational_req.dart';
import '../models/user_signin_req.dart';
import '../src/auth_api_service.dart';

class AuthRepositoryImp extends AuthRepository {
  @override
  Future<Either<Failure, UserEntity>> getUser() async {
    return (await getIt.call<AuthApiService>().getUser()).fold((error) {
      return Left(error);
    }, (user) {
      return Right(user.toEntity());
    });
  }

  @override
  Future<bool> isLoggedIn() async {
    return await getIt.call<AuthApiService>().isLogIn();
  }

  @override
  Future<Either<Failure, void>> signin(UserSigninReq params) async {
    return await getIt.call<AuthApiService>().signin(params);
  }

  @override
  Future<Either<Failure, void>> signup(UserCreationalReq params) async {
    return await getIt.call<AuthApiService>().signup(params);
  }

  @override
  Future<Either<Failure,void>> logOut() async {
    return await getIt.call<AuthApiService>().logOut();
  }

  @override
  Future<Either<Failure,void>> resetPasswordPyOldPassword(
      ResetPasswordPyOldPasswordReq params) async {
    return await getIt
        .call<AuthApiService>()
        .resetPasswordPyOldPassword(params);
  }

  @override
  Future<Either<Failure,void>> setUserInfo(SetUserInfoReq userInfo) async {
    String? imageUrl;

    if (userInfo.profileImage != null) {
      final uploadResult = await getIt
          .call<CloudinaryService>()
          .uploadProfileImage(userInfo.profileImage!);

      if (uploadResult.isLeft()) {
        return uploadResult.fold(
            (error) => Left(error), (url) => const Right(null));
      }

      imageUrl = uploadResult.fold((error) => null, (url) => url);
      userInfo.setProfileImageUrl(imageUrl!);
    }

    return await getIt.call<AuthApiService>().setUserInfo(userInfo);
  }

  @override
  Future<Either<Failure,void>> sendPasswordResetEmail(String email) async {
    return await getIt.call<AuthApiService>().sendPasswordResetEmail(email);
  }
}
