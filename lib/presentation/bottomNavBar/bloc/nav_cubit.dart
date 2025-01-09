import 'package:flutter_bloc/flutter_bloc.dart';
import 'nav_state.dart';

class NavCubit extends Cubit<NavState>{
  NavCubit():super(NavState.HomeScreen);

  void setScreen(NavState newScreen){
    emit(newScreen);
  }

}