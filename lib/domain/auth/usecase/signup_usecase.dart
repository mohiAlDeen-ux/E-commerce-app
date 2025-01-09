import '../../../core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import '../../../data/auth/models/user_creational_req.dart';
import '../repository/auth.dart';
import '../../../servise_locator.dart';

class SignupUsecase extends UseCase<Either,UserCreationalReq>{
  @override
  Future<Either> call({UserCreationalReq ? params}) async{
    return await getIt.call<AuthRepository>().signup(params!);
  }
  
}