import 'package:flutter_application_1/core/usecase/usecase.dart';
import 'package:flutter_application_1/domain/preferences/repository/preferences.dart';
import 'package:flutter_application_1/servise_locator.dart';

class GetLanguageUsecase extends UseCase<String,dynamic>{
  @override
  Future<String> call({params}) async{
  return await getIt.call<PreferencesRepository>().getLanguage();
  }

}