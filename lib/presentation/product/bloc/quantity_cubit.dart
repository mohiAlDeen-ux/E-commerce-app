import 'package:flutter_bloc/flutter_bloc.dart';

class QuantityCubit extends Cubit<int>{
  QuantityCubit():super(1);

  void increment (){
    if(state < 999){
    emit(state + 1);
    }
  }

  void decrement(){
    if(state > 1){
      emit(state - 1);
    }
  }

}