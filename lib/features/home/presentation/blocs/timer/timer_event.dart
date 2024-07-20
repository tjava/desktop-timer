part of 'timer_bloc.dart';

sealed class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object> get props => [];
}

class StartTimer extends TimerEvent {}

class UpdateTimer extends TimerEvent {
  final int seconds;

  const UpdateTimer(this.seconds);

  @override
  List<Object> get props => [seconds];
}

class StopTimer extends TimerEvent {}
