import '../../../core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import '../../../data/auth/models/confirm_verification_code_req.dart';
import '../repository/auth.dart';
import '../../../servise_locator.dart';

class ConfirmVerificationCodeUsecase extends UseCase<Either,ConfirmVerificationCodeReq>{
  @override
  Future<Either> call({ConfirmVerificationCodeReq ? params}) async{
    return await getIt.call<AuthRepository>().confirmVerificationCode(params!);
  }


}