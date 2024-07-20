import 'package:desktop_timer/core/constants/colors_constant.dart';
import 'package:desktop_timer/core/utils/snack_bar.dart';
import 'package:desktop_timer/core/widgets/generic_text.dart';
import 'package:desktop_timer/features/home/presentation/cubits/take_screenshot/take_screenshot_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenshotDisplay extends StatelessWidget {
  const ScreenshotDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TakeScreenshotCubit, TakeScreenshotState>(
      listener: (context, state) {
        if (state is Error) {
          ScaffoldMessenger.of(context).showSnackBar(
            showSnackBar(context: context, message: state.message, color: red),
          );
        }
      },
      builder: (context, state) {
        return state is Loaded
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    for (int index = 0; index < state.image.length; index++) ...[
                      Image.memory(state.image[index]),
                      SizedBox(height: 10.h),
                    ]
                  ],
                ),
              )
            : Center(
                child: GenericText(
                  text: 'No screenshot yet.',
                  color: blue,
                  size: 20.sp,
                  weight: FontWeight.w500,
                ),
              );
      },
    );
  }
}
