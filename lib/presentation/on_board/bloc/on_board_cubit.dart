import 'package:flutter_application_1/domain/auth/usecase/is_logged_in_usecase.dart';
import 'package:flutter_application_1/servise_locator.dart';
import "package:flutter_bloc/flutter_bloc.dart";

import 'on_board_state.dart';

class OnBoardCubit extends Cubit<OnBoardState>{
  OnBoardCubit(): super(ShowBoardState());

  void endOnBoard() async{
    bool isLoggedIn = await getIt.call<IsLoggedInUsecase>().call();

    if(isLoggedIn){
      emit(AuthState());
    }
    emit(UnAuthState());
  }

}

