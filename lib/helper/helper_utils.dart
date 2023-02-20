import 'package:flutter/services.dart';

class HelperUtils {
  static bool emailValidated(String email) {
    final regex = RegExp(
      r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    return regex.hasMatch(email.toString());
  }

  static bool passwordValidted(String password) {
    final RegExp passwordRegExp = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,10}$',
    );
    return passwordRegExp.hasMatch(password);
  }

  static List<TextInputFormatter>? formatterNumber({required int length}) {
    return [
      LengthLimitingTextInputFormatter(length),
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
    ];
  }

  static bool numberValidated({
    required String number,
    required int length,
  }) {
    return number.isNotEmpty && number.length >= length;
  }
}
