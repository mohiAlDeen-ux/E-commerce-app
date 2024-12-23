import 'package:flutter_application_1/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/domain/auth/repository/auth.dart';
import 'package:flutter_application_1/servise_locator.dart';

class SentVerificationCodeUsecase extends UseCase<Either,String>{

  @override
  Future<Either> call({String? params}) async{
    //await Future.delayed(const Duration(seconds: 2));
    return await getIt.call<AuthRepository>().sentVerificationCode(params!);
  }

}