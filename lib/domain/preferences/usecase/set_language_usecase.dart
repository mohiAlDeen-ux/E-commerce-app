import 'package:flutter_application_1/core/usecase/usecase.dart';
import 'package:flutter_application_1/domain/preferences/repository/preferences.dart';
import 'package:flutter_application_1/servise_locator.dart';

class SetLanguageUsecase extends UseCase<void,String>{
  @override
  Future<void> call({String? params}) async{
    getIt.call<PreferencesRepository>().setLanguage(params!);
  }
  
}