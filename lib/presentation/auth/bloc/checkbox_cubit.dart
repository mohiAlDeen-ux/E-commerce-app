import 'package:flutter_bloc/flutter_bloc.dart';

class CheckboxCubit extends Cubit<bool>{
  CheckboxCubit() : super(false);


  void toggleState(){
    emit(!state);
  }
}