import 'package:flutter/material.dart';
import 'package:video_call_app/components/device_helper.dart';
import '../components/app_colors.dart';
import '../components/dimens.dart';

class NavigationService {
  static final NavigationService instance = NavigationService._internal();

  NavigationService._internal();

  factory NavigationService() => instance;

  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  dynamic goBack({dynamic value}) => navigationKey.currentState?.pop(value);

  dynamic forceBack({required int turn}) {
    for (int i = 1; i <= turn; i++) {
      NavigationService.instance.goBack();
    }
  }

  Future<dynamic> navigateToScreen(Widget page, {arguments}) async =>
      navigationKey.currentState?.push(
        MaterialPageRoute(
          builder: (_) => page,
        ),
      );

  void showBottomSheet({
    required Widget child,
    required BuildContext context,
    bool isScrollControlled = false,
  }) {
    showModalBottomSheet(
      constraints: BoxConstraints(
        maxHeight: isScrollControlled
            ? DeviceHelper.shared.getHeight(context)
            : (DeviceHelper.shared.isTablet
                ? DeviceHelper.shared.getHeight(context) / Dimens.size3
                : DeviceHelper.shared.getHeight(context) / Dimens.size2),
      ),
      isScrollControlled: isScrollControlled,
      backgroundColor:
          isScrollControlled ? AppColors.brightGray : AppColors.aliceBlue,
      shape: isScrollControlled
          ? null
          : const RoundedRectangleBorder(
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
