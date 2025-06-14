import 'package:flutter_application_1/core/error/failures.dart';

import '../../../core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import '../../../data/auth/models/user_creational_req.dart';
import '../repository/auth.dart';
import '../../../servise_locator.dart';

class SignupUsecase extends UseCase<Either,UserCreationalReq>{
  @override
  Future<Either<Failure,void>> call({UserCreationalReq ? params}) async{
    return await getIt.call<AuthRepository>().signup(params!);
  }
  
}