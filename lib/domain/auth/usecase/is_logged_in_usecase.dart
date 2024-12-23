import 'package:flutter_application_1/core/usecase/usecase.dart';
import 'package:flutter_application_1/domain/auth/repository/auth.dart';
import 'package:flutter_application_1/servise_locator.dart';

class IsLoggedInUsecase extends UseCase<bool,dynamic>{
  @override
  Future<bool> call({params}) async{
    return await getIt.call<AuthRepository>().isLoggedIn();
  }
}