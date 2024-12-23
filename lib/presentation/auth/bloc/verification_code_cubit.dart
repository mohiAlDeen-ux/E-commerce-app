import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationCodeCubit extends Cubit<List<String>>{
  VerificationCodeCubit(): super([]);

  void updateCode(List<String> code){
    emit(code);
  }

  void reste(){
    emit([]);
  }

  int get codeLength{
    return state.length;
  }
  
  String get code{
    return state.toString() ;
  }
}