import 'package:auto_route/auto_route.dart';
import 'package:desktop_timer/features/home/presentation/blocs/timer/timer_bloc.dart';
import 'package:desktop_timer/features/home/presentation/cubits/take_screenshot/take_screenshot_cubit.dart';
import 'package:desktop_timer/features/home/presentation/widgets/screen.dart';
import 'package:desktop_timer/features/home/presentation/widgets/screenshot_btn.dart';
import 'package:desktop_timer/features/home/presentation/widgets/timer_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage<dynamic>()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TakeScreenshotCubit _takeScreenshotCubit;
  late final TimerBloc _timerBloc;

  @override
  void initState() {
    super.initState();
    _takeScreenshotCubit = TakeScreenshotCubit();
    _timerBloc = TimerBloc();
  }

  @override
  void dispose() {
    _takeScreenshotCubit.close();
    _timerBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TakeScreenshotCubit>.value(value: _takeScreenshotCubit),
        BlocProvider<TimerBloc>.value(value: _timerBloc),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              children: [
                const Expanded(child: Screen()),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TimerBtn(),
                    SizedBox(width: 30.h),
                    const ScreenshotBtn(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
