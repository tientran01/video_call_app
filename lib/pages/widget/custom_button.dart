import 'package:flutter/material.dart';
import 'package:video_call_app/components/dimens.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color bgColor;
  final double? heigth;
  final double? width;
  final Color fontColor;
  final VoidCallback? onTap;
  const CustomButton({
    Key? key,
    required this.title,
    required this.bgColor,
    this.heigth = Dimens.size60,
    this.width = Dimens.size200,
    this.fontColor = Colors.white,
    this.onTap,
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
        width: width,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(
            Dimens.size15,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            color: fontColor,
            fontSize: Dimens.size15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
