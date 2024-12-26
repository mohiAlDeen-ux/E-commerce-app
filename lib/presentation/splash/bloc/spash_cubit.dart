import 'package:flutter_application_1/domain/auth/usecase/is_logged_in_usecase.dart';
import 'package:flutter_application_1/domain/preferences/repository/preferences.dart';
import 'package:flutter_application_1/servise_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'spash_state.dart';

class SplashCubit extends Cubit<SplashState>{
  SplashCubit(): super(DisplaySplashState());

  void appStrted() async{

    await Future.delayed(const Duration(seconds: 2));

    bool isFirstTime = await getIt.call<PreferencesRepository>().isFirstTime();
    bool isLogedIn = await getIt.call<IsLoggedInUsecase>().call();

    if(isFirstTime){
      emit(FirstTimeState());
    }else if(isLogedIn){
      emit(AuthState());
    }else{
      emit(UnAuthState());
    }
  }
  
}