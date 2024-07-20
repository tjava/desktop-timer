part of 'take_screenshot_cubit.dart';

sealed class TakeScreenshotState extends Equatable {
  const TakeScreenshotState();

  @override
  List<Object> get props => [];
}

final class TakeScreenshotInitial extends TakeScreenshotState {}

class Loading extends TakeScreenshotState {
  const Loading();
}

class Loaded extends TakeScreenshotState {
  final List<Uint8List> image;

  const Loaded(this.image);

  @override
  List<Object> get props => [image];
}

class Error extends TakeScreenshotState {
  final String message;

  const Error(this.message);

  @override
  List<Object> get props => [message];
}
