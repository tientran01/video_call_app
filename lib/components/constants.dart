import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'dimens.dart';

class Constants {
  static const emptyBox = SizedBox();
  static const verticalBox5 = SizedBox(
    height: Dimens.size5,
  );
  static const verticalBox10 = SizedBox(
    height: Dimens.size10,
  );
  static const verticalBox20 = SizedBox(
    height: Dimens.size20,
  );
  static const verticalBox30 = SizedBox(
    height: Dimens.size30,
  );
  static const verticalBox50 = SizedBox(
    height: Dimens.size50,
  );
  static const horizontalBox5 = SizedBox(
    width: Dimens.size5,
  );
  static const horizontalBox10 = SizedBox(
    width: Dimens.size10,
  );
  static const edgeInsetsAll2 = EdgeInsets.all(Dimens.size2);
  static const edgeInsetsAll3 = EdgeInsets.all(Dimens.size3);
  static const edgeInsetsAll5 = EdgeInsets.all(Dimens.size5);
  static const edgeInsetsAll10 = EdgeInsets.all(Dimens.size10);
  static const edgeInsetsAll15 = EdgeInsets.all(Dimens.size15);
  static const edgeInsetsAll20 = EdgeInsets.all(Dimens.size20);
  static const edgeVertical10 = EdgeInsets.symmetric(vertical: Dimens.size10);
  static const edgeVertical20 = EdgeInsets.symmetric(vertical: Dimens.size20);
  static const edgeVertical35 = EdgeInsets.symmetric(vertical: Dimens.size35);
  static const edgeHorizontal15 =
      EdgeInsets.symmetric(horizontal: Dimens.size15);

  static dividerCustom({
    double height = Dimens.size1,
    Color color = AppColors.oldSilver,
  }) {
    return Divider(
      height: height,
      color: color,
    );
  }
}
