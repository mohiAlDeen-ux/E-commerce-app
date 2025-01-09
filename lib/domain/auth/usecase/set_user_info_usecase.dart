import '../../../core/usecase/usecase.dart';
import '../../../data/auth/models/set_user_info_req.dart';
import 'package:dartz/dartz.dart';
import '../../../data/auth/src/auth_api_service.dart';
import '../repository/auth.dart';
import '../../../servise_locator.dart';

class SetUserInfoUsecase extends UseCase<Either,SetUserInfoReq>{
  @override
  Future<Either> call({SetUserInfoReq? params}) {
    return getIt.call<AuthRepository>().setUserInfo(params!);
  }

}