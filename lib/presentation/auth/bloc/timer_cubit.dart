import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'timer_state.dart';

class TimerCubit extends Cubit<TimerState>{
  late Timer _timer;
  
  TimerCubit():super(TimerWatingState(DateTime(0, 0, 0, 0, 0, 10)) ){
      _start_decriment();
  }
  

  void _start_decriment(){
    _timer = Timer.periodic(const Duration(seconds: 1), (timer){
      if (state.remainingTime.isBefore(DateTime(0,0,0,0,0,1))){
        _timer.cancel();
        emit(TimerStopState());
    }else{
       emit(TimerWatingState(state.remainingTime.subtract(const Duration(seconds: 1))));
    }
    });
  }

  void reste(){
    emit(TimerWatingState(DateTime(0, 0, 0, 0, 0, 10)));
    _start_decriment();
  }
}