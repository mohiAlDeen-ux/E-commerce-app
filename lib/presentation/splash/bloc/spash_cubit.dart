import 'package:flutter_bloc/flutter_bloc.dart';

import 'spash_state.dart';

class SplashCubit extends Cubit<SplashState>{
  SplashCubit(): super(DisplaySplashState());

  void appStrted() async{
    await Future.delayed(const Duration(seconds: 2));
    // if first Time State
    emit(FirstTimeState());

    

  }
  
}