import 'package:flutter_application_1/common/bloc/button/button_state.dart';
import 'package:flutter_application_1/core/usecase/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';

class ButtonCubit extends Cubit<ButtonState>{
  ButtonCubit():super(ButtonInitialState());

  Future<void> execute(dynamic param, UseCase usecase) async{
    emit(ButtonLoadingState());
    try{
    Either returnedData = await usecase.call(params: param);
    returnedData.fold((errorMessage){
      emit(ButtonFailureState(errorMessage: errorMessage));
    }, (data){
      emit(ButtonSuccessState(returnedData: data));
    });
  }catch(errorMessage){
      emit(ButtonFailureState(errorMessage: errorMessage.toString()));
    }
}
}