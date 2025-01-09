import '../repository/preferences.dart';
import '../../../servise_locator.dart';
import '../../../core/usecase/usecase.dart';

class SetFirstTimeUsecase extends UseCase<void,dynamic>{
  @override
  Future<void> call({params}) async{
    return getIt.call<PreferencesRepository>().setFirstTime();
  }
}