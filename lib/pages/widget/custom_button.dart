import 'package:flutter/material.dart';
import 'package:video_call_app/components/app_colors.dart';
import 'package:video_call_app/components/constants.dart';
import 'package:video_call_app/components/device_helper.dart';
import 'package:video_call_app/components/dimens.dart';
import 'package:video_call_app/components/strings.dart';
import 'package:video_call_app/pages/widget/text_view.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color bgColor;
  final double? heigth;
  final double? width;
  final Color fontColor;
  final VoidCallback? onTap;
  final bool icon;
  final String? iconPath;
  const CustomButton({
    Key? key,
    required this.title,
    this.bgColor = AppColors.blue,
    this.heigth = Dimens.size60,
    this.width,
    this.fontColor = Colors.white,
    this.onTap,
    this.icon = false,
    this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.size30,
          vertical: Dimens.size15,
        ),
        height: heigth,
        width: width ?? DeviceHelper.shared.getWidth(context),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(
            Dimens.size15,
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
              fontColor: fontColor,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ),
    );
  }
}
