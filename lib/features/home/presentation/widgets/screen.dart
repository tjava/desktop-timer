import 'package:desktop_timer/features/home/presentation/widgets/screenshot_display.dart';
import 'package:desktop_timer/features/home/presentation/widgets/show_timer_headshot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 7,
          child: ShowTimerHeadshot(),
        ),
        SizedBox(width: 10.w),
        const Expanded(
          flex: 3,
          child: ScreenshotDisplay(),
        ),
      ],
    );
  }
}
