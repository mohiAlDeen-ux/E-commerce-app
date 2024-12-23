import 'package:flutter_application_1/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/data/auth/models/user_signin_req.dart';
import 'package:flutter_application_1/domain/auth/repository/auth.dart';
import 'package:flutter_application_1/servise_locator.dart';

class SigninUsecase extends UseCase<Either,UserSigninReq>{
  @override
  Future<Either> call({UserSigninReq ? params}) async{
    return await getIt.call<AuthRepository>().signin(params!);
  }
  
}