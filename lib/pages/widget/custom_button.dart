import 'package:flutter/material.dart';
import 'package:video_call_app/components/app_colors.dart';
import 'package:video_call_app/components/constants.dart';
import 'package:video_call_app/components/dimens.dart';
import 'package:video_call_app/components/strings.dart';
import 'package:video_call_app/pages/widget/text_view.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color bgColor;
  final double? width;
  final Color fontColor;
  final VoidCallback? onTap;
  final bool icon;
  final String? iconPath;
  final bool disableButton;
  const CustomButton({
    Key? key,
    required this.title,
    this.bgColor = AppColors.blue,
    this.width,
    this.fontColor = Colors.white,
    this.onTap,
    this.icon = false,
    this.iconPath,
    this.disableButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: disableButton ? () {} : onTap,
      child: Container(
        padding: Constants.edgeInsetsAll20,
        decoration: BoxDecoration(
          color: disableButton ? AppColors.brightGray : bgColor,
          borderRadius: BorderRadius.circular(
            Dimens.size10,
          ),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon
                ? Image.asset(
                    iconPath ?? Strings.empty,
                    width: Dimens.size25,
                  )
                : Constants.emptyBox,
            icon ? Constants.horizontalBox5 : Constants.emptyBox,
            TextView(
              text: title,
              fontColor: disableButton ? AppColors.oldSilver : fontColor,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ),
    );
  }
}
