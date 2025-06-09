import '../../../core/usecase/usecase.dart';
import '../repository/preferences.dart';
import '../../../servise_locator.dart';

class SetLanguageUsecase extends UseCase<void,String>{
  @override
  Future<void> call({String? params}) async{
    getIt.call<PreferencesRepository>().setLanguage(params!);
  }
  
}