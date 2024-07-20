import 'package:desktop_timer/core/constants/colors_constant.dart';
import 'package:desktop_timer/core/utils/globa_keys.dart';
import 'package:desktop_timer/navigator/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainDesktopTimer extends StatefulWidget {
  const MainDesktopTimer({super.key});

  static final appRouter = AppRouter();

  @override
  State<MainDesktopTimer> createState() => _MainDesktopTimerState();
}

class _MainDesktopTimerState extends State<MainDesktopTimer> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1000, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, widget) {
        return MaterialApp.router(
          title: 'Desktop Timer',
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: background,
            appBarTheme: const AppBarTheme(
              backgroundColor: background,
              surfaceTintColor: background,
              centerTitle: true,
              elevation: 0,
            ),
          ),
          scaffoldMessengerKey: scaffoldMessengerKey,
          routerConfig: MainDesktopTimer.appRouter.config(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
