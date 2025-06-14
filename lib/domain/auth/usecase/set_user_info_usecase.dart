import 'package:flutter_application_1/core/error/failures.dart';

import '../../../core/usecase/usecase.dart';
import '../../../data/auth/models/set_user_info_req.dart';
import 'package:dartz/dartz.dart';
import '../repository/auth.dart';
import '../../../servise_locator.dart';

class SetUserInfoUsecase extends UseCase<Either,SetUserInfoReq>{
  @override
  Future<Either<Failure,void>> call({SetUserInfoReq? params}) {
    return getIt.call<AuthRepository>().setUserInfo(params!);
  }

}