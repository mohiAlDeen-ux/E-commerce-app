import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/error/failures.dart';

import '../../../core/usecase/usecase.dart';
import '../repository/auth.dart';
import '../../../servise_locator.dart';

class SendPasswordResetEmailUsecase extends UseCase<Either,String>{
  @override
  Future<Either<Failure,void>> call({String? params}) async{
    return await getIt.call<AuthRepository>().sendPasswordResetEmail(params!);
  }
}