import 'package:flutter/material.dart';
import 'package:video_call_app/components/app_colors.dart';
import 'package:video_call_app/components/dimens.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final bool validateError;
  final String errorText;
  final TextInputType textInputType;
  final Color fillColor;
  final bool autoFocus;
  final bool isBorderRadius;
  final Widget? prefixIcon;
  const CustomTextFormField({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    this.validateError = true,
    this.errorText = '',
    this.textInputType = TextInputType.text,
    this.fillColor = AppColors.arsenic,
    this.autoFocus = false,
    this.isBorderRadius = false,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      controller: textEditingController,
      autofocus: autoFocus,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.oldSilver,
        ),
        border: OutlineInputBorder(
          borderRadius: isBorderRadius
              ? BorderRadius.zero
              : BorderRadius.circular(Dimens.size15),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: Dimens.size15,
          vertical: Dimens.size20,
        ),
        errorText: validateError ? errorText : null,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
