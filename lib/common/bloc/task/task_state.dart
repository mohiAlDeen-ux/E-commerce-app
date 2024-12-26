
abstract class TaskState{}

class InitialState extends TaskState {}

class LoadingState extends TaskState{}

class FailureState extends TaskState{
  String error;
  FailureState(this.error);
}

class SuccessState<Type> extends TaskState{
  Type data;

  SuccessState(this.data,);
}