import '../../../core/usecase/usecase.dart';
import '../repository/auth.dart';
import '../../../servise_locator.dart';

class IsLoggedInUsecase extends UseCase<bool,dynamic>{
  @override
  Future<bool> call({params}) async{
    return await getIt.call<AuthRepository>().isLoggedIn();
  }
}