import '../../../core/usecase/usecase.dart';
import "package:dartz/dartz.dart";
import '../../../data/auth/models/reset_password_py_token_req.dart';
import '../repository/auth.dart';
import '../../../servise_locator.dart';

class ResetPasswordPyTokenUseCase extends UseCase<Either,ResetPasswordPyTokenReq> {  
  @override
  Future<Either> call({ResetPasswordPyTokenReq ? params}) async{
    return await getIt.call<AuthRepository>().resetPasswordPyToken(params!);

  }
}
