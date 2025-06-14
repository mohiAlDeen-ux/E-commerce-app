import 'package:flutter_application_1/core/error/failures.dart';

import '../../../core/usecase/usecase.dart';
import "package:dartz/dartz.dart";
import '../../../data/auth/models/reset_password_py_old_password_req.dart';
import '../repository/auth.dart';
import '../../../servise_locator.dart';

class ResetPasswordPyOldPasswordUseCase extends UseCase<Either,ResetPasswordPyOldPasswordReq> {  
  @override
  Future<Either<Failure,void>> call({ResetPasswordPyOldPasswordReq ? params}) async{
    return await getIt.call<AuthRepository>().resetPasswordPyOldPassword(params!);

  }
}
