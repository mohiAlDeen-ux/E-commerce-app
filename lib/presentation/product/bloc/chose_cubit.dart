import 'package:flutter_bloc/flutter_bloc.dart';

class ChoseCubit extends Cubit<int>{
  ChoseCubit():super(0);

  void chose(int index){
    if(index >= 0){
      emit(index);
    }
  }

}