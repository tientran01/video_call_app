// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:video_call_app/components/app_colors.dart';
import 'package:video_call_app/components/constants.dart';
import 'package:video_call_app/components/device_helper.dart';
import 'package:video_call_app/components/dimens.dart';
import 'package:video_call_app/configs/locale/generated/l10n.dart';
import 'package:video_call_app/gen/assets.gen.dart';
import 'package:video_call_app/pages/meetings/widget/participant_people_widget.dart';
import 'package:video_call_app/pages/widget/no_splash_widget.dart';
import 'package:video_call_app/pages/widget/text_view.dart';
import 'package:video_call_app/route/navigation_service.dart';

class ToolBarBottomWidget extends StatefulWidget {
  // RtcEngine? engine;
  const ToolBarBottomWidget({
    Key? key,
    // required this.engine,
  }) : super(key: key);

  @override
  State<ToolBarBottomWidget> createState() => _ToolBarBottomWidgetState();
}

class _ToolBarBottomWidgetState extends State<ToolBarBottomWidget> {
  bool muted = false;
  bool stopVideo = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceHelper.shared.getWidth(context),
      padding: Constants.edgeRL15T5B30,
      decoration: const BoxDecoration(
        color: AppColors.aliceBlue,
      ),
      child: SingleChildScrollView(
        reverse: true,
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildToolBarItem(
              iconPath:
                  muted ? Assets.icons.icMicOff.path : Assets.icons.icMic.path,
              title: 'Mute',
              onTap: () {
                setState(() {
                  muted = !muted;
                });
                // widget.engine?.muteLocalAudioStream(muted);
              },
              iconColor: muted ? Colors.red : AppColors.blue,
            ),
            _buildToolBarItem(
              iconPath: stopVideo
                  ? Assets.icons.icVideoOff.path
                  : Assets.icons.icMeeting.path,
              title: S.current.stop_video,
              onTap: () {
                setState(() {
                  stopVideo = !stopVideo;
                });
                // widget.engine?.stopLocalVideoTranscoder();
              },
              iconColor: stopVideo ? Colors.red : AppColors.blue,
            ),
            _buildToolBarItem(
              iconPath: Assets.icons.icSwitchCamera.path,
              title: S.current.more,
              onTap: () {
                // widget.engine.switchCamera();
              },
            ),
            _buildToolBarItem(
              iconPath: Assets.icons.icShareScreen.path,
              title: S.current.share_screen,
              onTap: () {},
            ),
            _buildToolBarItem(
              iconPath: Assets.icons.icParticipants.path,
              title: S.current.participant,
              onTap: () => NavigationService.instance.navigateToScreen(
                const ParticipantPeopleWidget(),
              ),
            ),
            _buildToolBarItem(
              iconPath: Assets.icons.icMore.path,
              title: S.current.more,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToolBarItem({
    required String title,
    required String iconPath,
    required VoidCallback onTap,
    Color iconColor = AppColors.blue,
  }) {
    return Padding(
      padding: Constants.edgeInsetsAll10,
      child: NoSplashWidget(
        child: InkWell(
          onTap: onTap,
          child: Column(
            children: [
              Image.asset(
                iconPath,
                width: Dimens.size20,
                color: iconColor,
              ),
              TextView(
                text: title,
                fontColor: AppColors.blue,
                fontSize: Dimens.size10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
