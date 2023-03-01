import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_call_app/components/device_helper.dart';
import 'package:video_call_app/components/strings.dart';
import 'package:video_call_app/pages/widget/text_view.dart';
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

  Future<dynamic> showPopUp({
    required BuildContext context,
    bool barrierDismissible = true,
    required String title,
    required String content,
    String? subTitle,
    String? cancelActionText,
    required String defaultActionText,
    VoidCallback? cancelOnTap,
  }) {
    if (!Platform.isIOS) {
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: TextView(
            text: title,
            fontColor: AppColors.blue,
            fontSize: Dimens.size18,
          ),
          content: Column(
            children: [
              TextView(
                text: subTitle ?? Strings.empty,
              ),
              TextView(
                text: content,
              ),
            ],
          ),
          actions: <Widget>[
            if (cancelActionText != null)
              TextButton(
                onPressed:
                    cancelOnTap ?? () => NavigationService.instance.goBack(),
                child: TextView(text: cancelActionText),
              ),
            TextButton(
              child: TextView(text: defaultActionText),
              onPressed: () => NavigationService.instance.goBack(),
            ),
          ],
        ),
      );
    }
    return showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: TextView(
          text: title,
          fontColor: AppColors.blue,
          fontSize: Dimens.size18,
        ),
        content: Column(
          children: [
            TextView(
              text: subTitle ?? Strings.empty,
            ),
            TextView(
              text: content,
            ),
          ],
        ),
        actions: <Widget>[
          if (cancelActionText != null)
            CupertinoDialogAction(
              child: TextView(text: cancelActionText),
              onPressed: () => NavigationService.instance.goBack(),
            ),
          CupertinoDialogAction(
            // ignore: sort_child_properties_last
            child: TextView(
              text: defaultActionText,
              fontColor: AppColors.blue,
            ),
            onPressed: cancelOnTap ?? () => NavigationService.instance.goBack(),
          ),
        ],
      ),
    );
  }
}
