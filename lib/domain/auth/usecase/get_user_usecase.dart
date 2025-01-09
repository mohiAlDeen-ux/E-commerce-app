import '../../../core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import '../repository/auth.dart';
import '../../../servise_locator.dart';

class GetUserUsecase extends UseCase<Either,dynamic>{
  @override
  Future<Either> call({dynamic params}) async{
    return await getIt.call<AuthRepository>().getUser();
  }
  
}