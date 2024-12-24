import "package:flutter_application_1/domain/preferences/repository/preferences.dart";
import "package:flutter_application_1/servise_locator.dart";

import 'package:flutter_application_1/core/usecase/usecase.dart';

class IsFirstTimeUsecase extends UseCase<bool,dynamic>{
  @override
  Future<bool> call({params}) async{
    return getIt.call<PreferencesRepository>().isFirstTime();
  }
}