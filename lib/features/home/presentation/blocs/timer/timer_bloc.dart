import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc() : super(const TimerInitial()) {
    on<StartTimer>(_onStartTimer);
    on<UpdateTimer>(_onUpdateTimer);
    on<StopTimer>(_onStopTimer);
  }

  Timer? _timer;

  Future<void> _onStartTimer(StartTimer event, Emitter<TimerState> emit) async {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      add(UpdateTimer(timer.tick));
    });
  }

  Future<void> _onUpdateTimer(UpdateTimer event, Emitter<TimerState> emit) async {
    final minutes = ((event.seconds / 60) % 60).floor().toString().padLeft(2, '0');
    final seconds = (event.seconds % 60).floor().toString().padLeft(2, '0');
    emit(TimerInProgress('$minutes:$seconds'));
  }

  Future<void> _onStopTimer(StopTimer event, Emitter<TimerState> emit) async {
    _timer?.cancel();
    emit(const TimerStopped('00:00'));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
