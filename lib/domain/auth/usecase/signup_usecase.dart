import 'package:flutter_application_1/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/data/auth/models/user_creational_req.dart';
import 'package:flutter_application_1/domain/auth/repository/auth.dart';
import 'package:flutter_application_1/servise_locator.dart';

class SignupUsecase extends UseCase<Either,UserCreationalReq>{
  @override
  Future<Either> call({UserCreationalReq ? params}) async{
    return await getIt.call<AuthRepository>().signup(params!);
  }
  
}