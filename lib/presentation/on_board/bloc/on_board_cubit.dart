import "package:flutter_bloc/flutter_bloc.dart";

import '../../../domain/auth/usecase/is_logged_in_usecase.dart';
import '../../../domain/preferences/repository/preferences.dart';
import '../../../servise_locator.dart';
import 'on_board_state.dart';

class OnBoardCubit extends Cubit<OnBoardState>{
  OnBoardCubit(): super(ShowBoardState());

  void endOnBoard() async{
    getIt.call<PreferencesRepository>().setFirstTime();

    bool isLoggedIn = await getIt.call<IsLoggedInUsecase>().call();

    if(isLoggedIn){
      emit(AuthState());
    }
    emit(UnAuthState());
  }

}

