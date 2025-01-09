import '../../../domain/auth/usecase/is_logged_in_usecase.dart';
import '../../../domain/preferences/repository/preferences.dart';
import '../../../servise_locator.dart';
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