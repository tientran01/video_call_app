import 'package:flutter/material.dart';

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
    this.fontSize = Dimens.size17,
    this.fontColor = Colors.white,
    this.fontWeight = FontWeight.w500,
    this.textAlign,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: fontColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
