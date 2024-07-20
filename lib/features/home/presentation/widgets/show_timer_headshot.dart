import 'package:desktop_timer/core/constants/colors_constant.dart';
import 'package:desktop_timer/features/home/presentation/cubits/take_screenshot/take_screenshot_cubit.dart';
import 'package:desktop_timer/features/home/presentation/widgets/show_headshot.dart';
import 'package:desktop_timer/features/home/presentation/widgets/timer_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:screenshot/screenshot.dart';

class ShowTimerHeadshot extends StatelessWidget {
  const ShowTimerHeadshot({super.key});

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: context.read<TakeScreenshotCubit>().screenshotController,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(color: blue, width: 1.4),
        ),
        child: const Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: TimerDisplay(),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ShowHeadshot(),
            ),
          ],
        ),
      ),
    );
  }
}
