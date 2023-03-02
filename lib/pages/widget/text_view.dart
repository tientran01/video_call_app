import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_call_app/components/app_colors.dart';

import '../../components/dimens.dart';

class TextView extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color fontColor;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final bool upperCaseText;
  const TextView({
    Key? key,
    required this.text,
    this.fontSize = Dimens.size15,
    this.fontColor = AppColors.arsenic,
    this.fontWeight = FontWeight.w600,
    this.textAlign,
    this.maxLines,
    this.upperCaseText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      upperCaseText ? text.toUpperCase() : text,
      style: GoogleFonts.quicksand(
        textStyle: TextStyle(
          color: upperCaseText ? AppColors.oldSilver : fontColor,
          fontSize: upperCaseText ? Dimens.size13 : fontSize,
          fontWeight: fontWeight,
        ),
      ),
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
    );
  }
}
