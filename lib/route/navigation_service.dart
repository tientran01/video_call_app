import 'package:flutter/material.dart';
import 'package:video_call_app/components/device_helper.dart';

import '../components/app_colors.dart';
import '../components/dimens.dart';

class NavigationService {
  static final NavigationService instance = NavigationService._internal();

  NavigationService._internal();

  factory NavigationService() => instance;

  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  dynamic goBack() => navigationKey.currentState?.pop();

  Future<dynamic> navigateToScreen(Widget page, {arguments}) async =>
      navigationKey.currentState?.push(
        MaterialPageRoute(
          builder: (_) => page,
        ),
      );

  void showBottomSheet({
    required Widget child,
    required BuildContext context,
    double? height,
  }) {
    showModalBottomSheet(
      constraints: BoxConstraints(
        maxHeight: height ?? MediaQuery.of(context).size.height / Dimens.size2,
        maxWidth: DeviceHelper.shared.getWidth(context),
      ),
      backgroundColor: AppColors.eerieBlack,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimens.size20),
          topRight: Radius.circular(Dimens.size20),
        ),
      ),
      context: context,
      builder: (context) => child,
    );
  }
}
