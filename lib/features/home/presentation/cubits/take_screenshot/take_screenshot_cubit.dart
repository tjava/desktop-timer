import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:screenshot/screenshot.dart';

part 'take_screenshot_state.dart';

class TakeScreenshotCubit extends Cubit<TakeScreenshotState> {
  TakeScreenshotCubit() : super(TakeScreenshotInitial()) {
    _screenshotController = ScreenshotController();
  }

  late final ScreenshotController _screenshotController;
  ScreenshotController get screenshotController => _screenshotController;

  final List<Uint8List> _image = [];
  List<Uint8List> get image => _image;

  Future<void> takeScreenshot() async {
    emit(const Loading());

    final newImage = await _screenshotController.capture();
    if (newImage == null) {
      emit(const Error('Oops, something went wrong. please try again.'));
    } else {
      _image.add(newImage);
      emit(Loaded(_image));
    }
  }

  @override
  Future<void> close() {
    // TODO: implement close
    return super.close();
  }
}
