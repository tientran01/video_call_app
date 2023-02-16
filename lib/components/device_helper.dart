import 'dart:io';
import 'dart:ui' as ui;

import 'package:video_call_app/pages/home/screen.dart';

class DeviceHelper {
  static final shared = DeviceHelper._internal();

  DeviceHelper._internal();

  final double devicePixelRatio = ui.window.devicePixelRatio;
  final ui.Size size = ui.window.physicalSize;
  final locale = ui.window.locale;

  double get width => size.width;

  double get height => size.height;

  bool get isTablet {
    if (Platform.isAndroid) {
      if (devicePixelRatio < 2 && (width >= 800 && height >= 1000)) {
        return true;
      }
      if (devicePixelRatio < 2 && (width >= 1000 && height >= 1000)) {
        return true;
      }
      if (devicePixelRatio == 2 && (width >= 1920 || height >= 1920)) {
        return true;
      }
    } else {
      if (devicePixelRatio < 2 && (width >= 1000 || height >= 1000)) {
        return true;
      }
      if (devicePixelRatio == 2 && (width >= 1920 || height >= 1920)) {
        return true;
      }
    }
    return false;
  }

  double getWidth(BuildContext context) => MediaQuery.of(context).size.width;
  double getHeight(BuildContext context) => MediaQuery.of(context).size.height;

  double getTextSize({
    required double size,
    required BuildContext context,
  }) {
    double calc = size / 10;
    return (MediaQuery.of(context).size.height * 0.01) * calc;
  }
}
