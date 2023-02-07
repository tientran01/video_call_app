import 'package:flutter/material.dart';
import 'package:video_call_app/components/app_colors.dart';
import 'package:video_call_app/configs/locale/generated/l10n.dart';
import 'package:video_call_app/gen/assets.gen.dart';
import 'package:video_call_app/pages/meetings/widget/custom_button_icon_widget.dart';

class MeetingPage extends StatelessWidget {
  const MeetingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButtonIconWidget(
                iconPath: Assets.icons.icMeeting.path,
                title: S.current.new_meeting,
                bgColor: AppColors.beer,
              ),
              CustomButtonIconWidget(
                iconPath: Assets.icons.icAdd.path,
                title: S.current.join,
              ),
              CustomButtonIconWidget(
                iconPath: Assets.icons.icCalendar.path,
                title: S.current.schedule,
              ),
              CustomButtonIconWidget(
                iconPath: Assets.icons.icShareScreen.path,
                title: S.current.share_screen,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
