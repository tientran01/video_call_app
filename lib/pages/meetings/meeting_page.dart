import 'screen.dart';

class MeetingPage extends BaseScreen {
  const MeetingPage({Key? key}) : super(key: key);

  @override
  MeetingPageState createState() => MeetingPageState();
}

class MeetingPageState extends BaseScreenState<MeetingPage> {
  @override
  ActionButtonType actionButtonType() => ActionButtonType.actionInformation;

  @override
  String title() => S.current.meetings;

  @override
  Widget body() {
    return SafeArea(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: Dimens.size10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButtonIconWidget(
                  iconPath: Assets.icons.icMeeting.path,
                  title: S.current.new_meeting,
                  bgColor: AppColors.beer,
                  onTap: () => NavigationService.instance.navigateToScreen(
                    const NewMeetingPage(),
                  ),
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
          ),
          Constants.verticalBox20,
          InkWell(
            splashColor: Colors.transparent,
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              width: DeviceHelper.shared.getWidth(context),
              padding: Constants.edgeVertical20,
              decoration: const BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(
                    color: AppColors.arsenic,
                    width: Dimens.size1,
                  ),
                ),
              ),
              child: TextView(
                text: S.current.add_a_calendar,
                fontColor: AppColors.blue,
              ),
            ),
          )
        ],
      ),
    );
  }
}
