import 'package:flutter_application_1/common/bloc/task/task_state.dart';
import 'package:flutter_application_1/core/usecase/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:dartz/dartz.dart";

class TaskCubit extends Cubit<TaskState>{
  TaskCubit():super(InitialState());


  Future<void> execute<Type,Params>(UseCase<Type,Params> useCase, Params params) async{
    emit(LoadingState());
    
    try{
      Type data = await useCase.call(params: params);
      print(Type.toString());
      if(Type.toString() == "Either<dynamic, dynamic>"){
        (data as Either).fold((error){
          emit(FailureState(error.toString()));
        }, (returnedData){
          emit(SuccessState(returnedData));
        });
      }else{
        emit(SuccessState<Type>(data));
      }
    }catch(error){
      emit(FailureState(error.toString()));
    }  
  }

}