import 'package:flutter/material.dart';
import 'package:video_call_app/components/app_colors.dart';
import 'package:video_call_app/components/constants.dart';
import 'package:video_call_app/components/dimens.dart';
import 'package:video_call_app/pages/widget/no_splash_widget.dart';
import 'package:video_call_app/pages/widget/text_view.dart';

class ToolBarItemWidget extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback onTap;
  final Color iconColor;
  final Color fontColor;
  const ToolBarItemWidget({
    Key? key,
    required this.title,
    required this.iconPath,
    required this.onTap,
    this.iconColor = AppColors.blue,
    this.fontColor = AppColors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.edgeInsetsAll10,
      child: NoSplashWidget(
        child: InkWell(
          onTap: onTap,
          child: Column(
            children: [
              Image.asset(
                iconPath,
                width: Dimens.size20,
                color: iconColor,
              ),
              TextView(
                text: title,
                fontColor: fontColor,
                fontSize: Dimens.size10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
