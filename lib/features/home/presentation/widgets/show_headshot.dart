import 'package:camera_macos/camera_macos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowHeadshot extends StatefulWidget {
  const ShowHeadshot({super.key});

  @override
  State<ShowHeadshot> createState() => _ShowHeadshotState();
}

class _ShowHeadshotState extends State<ShowHeadshot> {
  late final GlobalKey _cameraKey;
  late final CameraMacOSController _macOSController;

  @override
  void initState() {
    super.initState();
    _cameraKey = GlobalKey(debugLabel: "cameraKey");
  }

  @override
  void dispose() {
    _macOSController.destroy();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      width: 180.w,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: CameraMacOSView(
          key: _cameraKey,
          fit: BoxFit.fill,
          cameraMode: CameraMacOSMode.photo,
          onCameraInizialized: (CameraMacOSController controller) {
            _macOSController = controller;
            setState(() {});
          },
        ),
      ),
    );
  }
}
