import 'package:flutter/material.dart';
import 'package:video_call_app/components/constants.dart';
import 'package:video_call_app/components/device_helper.dart';
import 'package:video_call_app/configs/locale/generated/l10n.dart';
import 'package:video_call_app/pages/widget/text_view.dart';
import '../../../components/app_colors.dart';
import '../../../components/dimens.dart';

class ChoiceActionWidget extends StatelessWidget {
  const ChoiceActionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceHelper.shared.getWidth(context) *
          Dimens.size2.toInt() /
          Dimens.size3.toInt(),
      padding: Constants.edgeVertical10,
      decoration: BoxDecoration(
        color: AppColors.brightGray,
        borderRadius: BorderRadius.circular(
          Dimens.size15,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _choiceActionItem(
            onTap: () {},
            title: S.current.invite_contact,
          ),
          Constants.dividerCustom(),
          _choiceActionItem(
            onTap: () {},
            title: S.current.create_an_phone_contact,
          ),
          Constants.dividerCustom(),
          _choiceActionItem(
            onTap: () {},
            title: S.current.create_new_channel,
          ),
          Constants.dividerCustom(),
          _choiceActionItem(
            onTap: () {},
            title: S.current.join_a_channel,
          ),
        ],
      ),
    );
  }

  Widget _choiceActionItem({
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: Constants.edgeInsetsAll15,
        child: TextView(
          text: title,
        ),
      ),
    );
  }
}
