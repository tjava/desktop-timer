import 'package:desktop_timer/core/constants/colors_constant.dart';
import 'package:desktop_timer/core/widgets/generic_text.dart';
import 'package:desktop_timer/features/home/presentation/blocs/timer/timer_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimerDisplay extends StatelessWidget {
  const TimerDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) {
        return state is TimerInProgress
            ? GenericText(
                text: 'Timer: ${state.duration}',
                color: blue,
                size: 50.sp,
                weight: FontWeight.w800,
              )
            : GenericText(
                text: 'Timer: ${state.duration}',
                color: blue,
                size: 50.sp,
                weight: FontWeight.w800,
              );
      },
    );
  }
}
