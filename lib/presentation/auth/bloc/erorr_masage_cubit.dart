import 'dart:async';

import 'package:flutter_application_1/presentation/auth/bloc/erorr_masager_sate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorMasageCubit extends Cubit<ErrorMasageState>{
  Timer? _timer;

  ErrorMasageCubit():super(ErrorMasageDisappearsState(""));

  void showError(String msg) async {
    _timer?.cancel();

    emit(ErrorMasageShowState(msg));
    _timer = Timer(const Duration(seconds: 4), () {
      emit(ErrorMasageDisappearsState(msg)); 
      });
    
  }

  @override 
  Future<void> close() {
     _timer?.cancel();
      return super.close(); 
  }
  
}