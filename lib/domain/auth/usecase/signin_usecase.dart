import '../../../core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import '../../../data/auth/models/user_signin_req.dart';
import '../repository/auth.dart';
import '../../../servise_locator.dart';

class SigninUsecase extends UseCase<Either,UserSigninReq>{
  @override
  Future<Either> call({UserSigninReq ? params}) async{
    return await getIt.call<AuthRepository>().signin(params!);
  }
  
}