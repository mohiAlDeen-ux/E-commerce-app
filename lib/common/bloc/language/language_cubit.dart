import 'package:flutter_application_1/common/bloc/language/language_state.dart';
import 'package:flutter_application_1/domain/preferences/usecase/get_language_usecase.dart';
import 'package:flutter_application_1/domain/preferences/usecase/set_language_usecase.dart';
import 'package:flutter_application_1/servise_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';


class LanguageCubit extends Cubit<LanguageState>{
  LanguageCubit():super(LoadingState());
  
  void getSavedLanguage() async{
    final language = await getIt.call<GetLanguageUsecase>().call();
    emit(LocalState(locale: Locale(language)));  
  }

  void setLanguage(String language) async{
    await getIt.call<SetLanguageUsecase>().call(params: language);
    getSavedLanguage();
  }
}



