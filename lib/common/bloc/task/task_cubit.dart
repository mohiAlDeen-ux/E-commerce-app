import "package:dartz/dartz.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/usecase/usecase.dart';
import 'task_state.dart';

abstract class TaskCubit extends Cubit<TaskState>{
  TaskCubit():super(InitialState());


  Future<void> execute<Type,Params>(UseCase<Type,Params> useCase, [Params? params]) async{
    emit(LoadingState());
    Type data;
    try{
      if(params == null){
        data = await useCase.call();
      }else{
        data = await useCase.call(params: params);
      }
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