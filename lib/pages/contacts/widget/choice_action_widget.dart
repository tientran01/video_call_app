import 'package:flutter/material.dart';
import 'package:video_call_app/components/constants.dart';
import 'package:video_call_app/configs/locale/generated/l10n.dart';
import 'package:video_call_app/pages/widget/text_view.dart';

import '../../../components/app_colors.dart';
import '../../../components/dimens.dart';

class ChoiceActionWidget extends StatelessWidget {
  const ChoiceActionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Constants.edgeInsetsAll3,
      decoration: BoxDecoration(
        color: AppColors.arsenic,
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
          _choiceActionItem(
            onTap: () {},
            title: S.current.create_an_phone_contact,
          ),
          _choiceActionItem(
            onTap: () {},
            title: S.current.create_new_channel,
          ),
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
      child: TextView(
        text: title,
        fontSize: Dimens.size17,
      ),
    );
  }
}
