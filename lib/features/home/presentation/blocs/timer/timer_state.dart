part of 'timer_bloc.dart';

sealed class TimerState extends Equatable {
  final String duration;

  const TimerState(this.duration);

  @override
  List<Object> get props => [duration];
}

class TimerInitial extends TimerState {
  const TimerInitial() : super('00:00');
}

class TimerInProgress extends TimerState {
  const TimerInProgress(super.duration);
}

class TimerStopped extends TimerState {
  const TimerStopped(super.duration);
}
