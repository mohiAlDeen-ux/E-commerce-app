import 'package:flutter_application_1/core/usecase/usecase.dart';
import "package:dartz/dartz.dart";
import 'package:flutter_application_1/data/auth/models/reset_password_py_old_password_req.dart';
import 'package:flutter_application_1/domain/auth/repository/auth.dart';
import 'package:flutter_application_1/servise_locator.dart';

class ResetPasswordPyOldPasswordUseCase extends UseCase<Either,ResetPasswordPyOldPasswordReq> {  
  @override
  Future<Either> call({ResetPasswordPyOldPasswordReq ? params}) async{
    return await getIt.call<AuthRepository>().resetPasswordPyOldPassword(params!);

  }
}
