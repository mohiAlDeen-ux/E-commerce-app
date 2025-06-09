import '../../../core/usecase/usecase.dart';
import '../repository/preferences.dart';
import '../../../servise_locator.dart';

class GetLanguageUsecase extends UseCase<String,dynamic>{
  @override
  Future<String> call({params}) async{
  return await getIt.call<PreferencesRepository>().getLanguage();
  }

}