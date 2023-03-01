

import 'widget.dart';

class LeaveMeetingWidget extends StatelessWidget {
  final RtcEngine engine;
  const LeaveMeetingWidget({
    Key? key,
    required this.engine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Constants.edgeHorizontal15,
      width: DeviceHelper.shared.getWidth(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          CustomButton(
            title: S.current.end_meeting_for_all,
            bgColor: Colors.red,
            onTap: () {
              NavigationService.instance.forceBack(turn: Dimens.size2.toInt());
              engine.leaveChannel();
            },
          ),
          Constants.verticalBox20,
          CustomButton(
            title: S.current.leave_meeting,
            bgColor: Colors.white,
            fontColor: AppColors.blue,
            onTap: () {},
          ),
          Spacer(
            flex: Dimens.size4.toInt(),
          ),
          CircleIconButtonWidget(
            iconColor: AppColors.blue,
            iconPath: Assets.icons.icClear.path,
            onPressed: () => NavigationService.instance.goBack(),
            title: S.current.cancel,
            fontColor: AppColors.blue,
          ),
          Constants.verticalBox20,
        ],
      ),
    );
  }
}
