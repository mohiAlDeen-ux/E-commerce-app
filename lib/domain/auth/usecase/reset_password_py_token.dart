import 'package:flutter_application_1/core/usecase/usecase.dart';
import "package:dartz/dartz.dart";
import 'package:flutter_application_1/data/auth/models/reset_password_py_token_req.dart';
import 'package:flutter_application_1/domain/auth/repository/auth.dart';
import 'package:flutter_application_1/servise_locator.dart';

class ResetPasswordPyTokenUseCase extends UseCase<Either,ResetPasswordPyTokenReq> {  
  @override
  Future<Either> call({ResetPasswordPyTokenReq ? params}) async{
    return await getIt.call<AuthRepository>().resetPasswordPyToken(params!);

  }
}
