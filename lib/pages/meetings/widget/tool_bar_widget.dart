import 'widget.dart';

class ToolBarWidget extends StatelessWidget {
  final VoidCallback? onTapUnmute;
  final VoidCallback? onTapSwitchCamera;
  final VoidCallback? onTapParticipants;
  final bool muted;
  const ToolBarWidget({
    Key? key,
    this.onTapUnmute,
    this.onTapSwitchCamera,
    this.onTapParticipants,
    this.muted = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: DeviceHelper.shared.getWidth(
            context,
          ),
        ),
        padding: Constants.edgeRL15T5B20,
        decoration: const BoxDecoration(
          color: AppColors.aliceBlue,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ToolBarItemWidget(
              iconPath:
                  muted ? Assets.icons.icMicOff.path : Assets.icons.icMic.path,
              title: muted ? S.current.mute : S.current.unmute,
              onTap: onTapUnmute,
              iconColor: muted ? Colors.red : AppColors.blue,
              fontColor: muted ? Colors.red : AppColors.blue,
            ),
            ToolBarItemWidget(
              iconPath: Assets.icons.icSwitchCamera.path,
              title: S.current.switch_camera,
              onTap: onTapSwitchCamera,
            ),
            ToolBarItemWidget(
              iconPath: Assets.icons.icChat.path,
              title: S.current.chat,
            ),
            ToolBarItemWidget(
              iconPath: Assets.icons.icParticipants.path,
              title: S.current.participant,
              onTap: onTapParticipants,
            ),
          ],
        ),
      ),
    );
  }
}
