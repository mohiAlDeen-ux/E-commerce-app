abstract class TimerState{
  DateTime remainingTime;
  TimerState(this.remainingTime);
}

class TimerWatingState extends TimerState{
  DateTime remainingTime;
  TimerWatingState(this.remainingTime):super(remainingTime);
}

class TimerStopState extends TimerState{
  TimerStopState() : super(DateTime(0,0,0,0,0,0));
}