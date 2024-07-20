import 'package:desktop_timer/core/constants/colors_constant.dart';
import 'package:desktop_timer/core/widgets/generic_text.dart';
import 'package:desktop_timer/features/home/presentation/blocs/timer/timer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimerBtn extends StatefulWidget {
  const TimerBtn({super.key});

  @override
  State<TimerBtn> createState() => _TimerBtnState();
}

class _TimerBtnState extends State<TimerBtn> {
  bool _timerRunInProgress = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<TimerBloc, TimerState>(
      listener: (context, state) {
        if (state is TimerInProgress) {
          _timerRunInProgress = true;
        } else {
          _timerRunInProgress = false;
        }
        setState(() {});
      },
      child: GestureDetector(
        onTap: () {
          if (_timerRunInProgress) {
            context.read<TimerBloc>().add(StopTimer());
          } else {
            context.read<TimerBloc>().add(StartTimer());
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
              colors: [
                Colors.lightBlueAccent,
                blue,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: GenericText(
            text: _timerRunInProgress ? 'Stop Timer' : 'Start Timer',
            color: background,
          ),
        ),
      ),
    );
  }
}
