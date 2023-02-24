import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_call_app/components/app_colors.dart';
import 'package:video_call_app/components/constants.dart';
import 'package:video_call_app/components/dimens.dart';
import 'package:video_call_app/components/enums.dart';
import 'package:video_call_app/components/strings.dart';
import 'package:video_call_app/configs/locale/generated/l10n.dart';
import 'package:video_call_app/helper/helper_utils.dart';
import 'package:video_call_app/pages/widget/text_view.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final String errorText;
  final Color fillColor;
  final bool autoFocus;
  final bool isBorderRadius;
  final Function(String)? onChanged;
  final Widget suffixIcon;
  final SuffixWidgetTextField suffixWidgetType;
  final PrefixWidgetTextField prefixWidgetType;
  final String? iconPrefixPath;
  final String? textPrefix;
  final TypeInputTextField typeInputTextField;
  final List<TextInputFormatter>? formatter;
  const CustomTextFormField({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    this.errorText = '',
    this.fillColor = AppColors.brightGray,
    this.autoFocus = false,
    this.isBorderRadius = false,
    this.onChanged,
    this.suffixIcon = Constants.emptyBox,
    this.suffixWidgetType = SuffixWidgetTextField.none,
    this.prefixWidgetType = PrefixWidgetTextField.none,
    this.iconPrefixPath,
    this.textPrefix,
    this.typeInputTextField = TypeInputTextField.normal,
    this.formatter,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  String? value;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: (widget.fillColor == AppColors.arsenic)
            ? Colors.white
            : AppColors.arsenic,
      ),
      keyboardType: keyboard,
      controller: widget.textEditingController,
      autofocus: widget.autoFocus,
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.fillColor,
        hintText: widget.hintText,
        hintStyle: GoogleFonts.quicksand(
          color: AppColors.oldSilver.withOpacity(Dimens.opacity4),
          fontWeight: FontWeight.w600,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: widget.isBorderRadius
              ? BorderRadius.zero
              : BorderRadius.circular(Dimens.size15),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: Dimens.size15,
          vertical: Dimens.size20,
        ),
        errorStyle: const TextStyle(
          height: Dimens.size0,
        ),
        errorMaxLines: Dimens.size3.toInt(),
        prefixIcon: prefixWidget,
        focusedBorder: OutlineInputBorder(
          borderRadius: widget.isBorderRadius
              ? BorderRadius.zero
              : BorderRadius.circular(
                  Dimens.size15,
                ),
          borderSide: BorderSide.none,
        ),
        suffixIcon: suffixWidget,
      ),
      onChanged: widget.onChanged,
      validator: (value) => validatorText(value ?? Strings.empty),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: widget.formatter,
    );
  }

  Widget get suffixWidget {
    switch (widget.suffixWidgetType) {
      case SuffixWidgetTextField.suffixIconClear:
        return widget.suffixIcon;
      case SuffixWidgetTextField.none:
        return Constants.emptyBox;
    }
  }

  Widget get prefixWidget {
    switch (widget.prefixWidgetType) {
      case PrefixWidgetTextField.prefixIcon:
        return IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          onPressed: () {},
          icon: Image.asset(
            widget.iconPrefixPath ?? Strings.empty,
            color: AppColors.oldSilver,
            width: Dimens.size25,
          ),
        );
      case PrefixWidgetTextField.prefixText:
        return Padding(
          padding: Constants.edgeInsetsAll15,
          child: TextView(
            text: widget.textPrefix ?? Strings.empty,
          ),
        );
      case PrefixWidgetTextField.none:
        return Constants.emptyBox;
    }
  }

  TextInputType get keyboard {
    switch (widget.typeInputTextField) {
      case TypeInputTextField.phoneNumber:
      case TypeInputTextField.birthdayYear:
      case TypeInputTextField.channelId:
        return TextInputType.phone;
      case TypeInputTextField.normal:
      case TypeInputTextField.email:
      case TypeInputTextField.password:
        return TextInputType.text;
    }
  }

  String? validatorText(String value) {
    switch (widget.typeInputTextField) {
      case TypeInputTextField.email:
        if (!HelperUtils.emailValidated(value)) {
          return S.current.email_invalid;
        }
        return Strings.empty;
      case TypeInputTextField.password:
        if (!HelperUtils.passwordValidted(value)) {
          return S.current.password_invalid;
        }
        return Strings.empty;
      case TypeInputTextField.birthdayYear:
        if (!HelperUtils.numberValidated(
          number: value,
          length: Dimens.size4.toInt(),
        )) {
          return S.current.please_confirm_your_birth_year;
        }
        return Strings.empty;
      default:
        return null;
    }
  }
}
