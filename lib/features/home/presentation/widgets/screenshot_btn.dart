import 'package:desktop_timer/core/constants/colors_constant.dart';
import 'package:desktop_timer/core/widgets/generic_text.dart';
import 'package:desktop_timer/features/home/presentation/cubits/take_screenshot/take_screenshot_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenshotBtn extends StatelessWidget {
  const ScreenshotBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<TakeScreenshotCubit>().takeScreenshot();
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
        child: const GenericText(
          text: 'Take Screenshot',
          color: background,
        ),
      ),
    );
  }
}
