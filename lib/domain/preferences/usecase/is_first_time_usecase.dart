import "../repository/preferences.dart";
import "../../../servise_locator.dart";

import '../../../core/usecase/usecase.dart';

class IsFirstTimeUsecase extends UseCase<bool,dynamic>{
  @override
  Future<bool> call({params}) async{
    return getIt.call<PreferencesRepository>().isFirstTime();
  }
}