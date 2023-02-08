import 'package:flutter/material.dart';
import 'package:video_call_app/components/app_colors.dart';
import 'package:video_call_app/components/constants.dart';
import 'package:video_call_app/components/dimens.dart';

class CustomButtonIconWidget extends StatelessWidget {
  final String iconPath;
  final Color bgColor;
  final VoidCallback? onTap;
  final String title;
  const CustomButtonIconWidget({
    Key? key,
    required this.iconPath,
    this.bgColor = AppColors.blue,
    this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Constants.edgeInsetsAll10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            highlightColor: Colors.transparent,
            onTap: onTap,
            child: Container(
              padding: Constants.edgeInsetsAll15,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(
                  Dimens.size20,
                ),
              ),
              child: Image.asset(
                iconPath,
                width: Dimens.size30,
                color: Colors.white,
              ),
            ),
          ),
          Constants.verticalBox5,
          Text(
            title,
            style: const TextStyle(
              fontSize: Dimens.size15,
              color: AppColors.oldSilver,
            ),
          ),
        ],
      ),
    );
  }
}
