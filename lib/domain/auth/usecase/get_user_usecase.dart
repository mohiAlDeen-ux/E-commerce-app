import 'package:flutter_application_1/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/domain/auth/repository/auth.dart';
import 'package:flutter_application_1/servise_locator.dart';

class GetUserUsecase extends UseCase<Either,dynamic>{
  @override
  Future<Either> call({dynamic params}) async{
    return await getIt.call<AuthRepository>().getUser(params);
  }
  
}