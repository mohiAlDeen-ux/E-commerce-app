import 'package:flutter_application_1/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/data/auth/models/confirm_verification_code_req.dart';
import 'package:flutter_application_1/domain/auth/repository/auth.dart';
import 'package:flutter_application_1/servise_locator.dart';

class ConfirmVerificationCodeUsecase extends UseCase<Either,ConfirmVerificationCodeReq>{
  @override
  Future<Either> call({ConfirmVerificationCodeReq ? params}) async{
    return await getIt.call<AuthRepository>().confirmVerificationCode(params!);
  }


}