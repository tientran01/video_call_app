import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_call_app/components/app_colors.dart';
import 'package:video_call_app/components/device_helper.dart';

import '../../components/dimens.dart';

class TextView extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color fontColor;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  const TextView({
    Key? key,
    required this.text,
    this.fontSize = Dimens.size25,
    this.fontColor = AppColors.arsenic,
    this.fontWeight = FontWeight.w600,
    this.textAlign,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.quicksand(
        textStyle: TextStyle(
          color: fontColor,
          fontSize: DeviceHelper.shared.getTextSize(
            size: fontSize,
            context: context,
          ),
          fontWeight: fontWeight,
        ),
      ),
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
