import 'package:flutter_application_1/core/error/failures.dart';
import 'package:flutter_application_1/domain/auth/entity/user_entity.dart';

import '../../../core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import '../repository/auth.dart';
import '../../../servise_locator.dart';

class GetUserUsecase extends UseCase<Either,dynamic>{
  @override
  Future<Either<Failure,UserEntity>> call({dynamic params}) async{
    return await getIt.call<AuthRepository>().getUser();
  }
  
}