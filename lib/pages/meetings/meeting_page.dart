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
  void onTapAction() {
    NavigationService.instance.showBottomSheet(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.size10,
          vertical: Dimens.size20,
        ),
        child: Column(
          children: [
            Column(
              children: [
                TextView(
                  text: S.current.personal_metting_id,
                  fontColor: AppColors.oldSilver,
                  fontSize: Dimens.size18,
                  fontWeight: FontWeight.w600,
                ),
                Constants.verticalBox10,
                const TextView(
                  text: "234 444 444",
                  fontSize: Dimens.size25,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            Constants.verticalBox20,
            Container(
              width: MediaQuery.of(context).size.width,
              padding: Constants.edgeInsetsAll10,
              decoration: BoxDecoration(
                color: AppColors.raisinBlack,
                borderRadius: BorderRadius.circular(
                  Dimens.size10,
                ),
              ),
              child: Column(
                children: [
                  _buildPersonalMeetingItem(
                    () {},
                    title: S.current.start_meeting,
                    iconPath: Assets.icons.icCalendar.path,
                  ),
                  _buildPersonalMeetingItem(
                    () {},
                    title: S.current.send_invitaion,
                    iconPath: Assets.icons.icSend.path,
                  ),
                  _buildPersonalMeetingItem(
                    () {},
                    title: S.current.edit_meeting,
                    iconPath: Assets.icons.icEdit.path,
                  ),
                ],
              ),
            ),
            Constants.verticalBox10,
            InkWell(
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () => NavigationService.instance.goBack(),
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: Constants.edgeInsetsAll10,
                child: Text(
                  S.current.cancel,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: Dimens.size17,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      context: context,
    );
  }

  Widget _buildPersonalMeetingItem(
    VoidCallback? onTap, {
    required String title,
    required String iconPath,
  }) {
    return Container(
      padding: Constants.edgeInsetsAll10,
      child: Row(
        children: [
          Expanded(
            flex: Dimens.size3.toInt(),
            child: TextView(
              text: title,
            ),
          ),
          Expanded(
            child: IconButton(
              alignment: Alignment.bottomRight,
              onPressed: () {},
              icon: Image.asset(
                iconPath,
                width: Dimens.size25,
                color: AppColors.arsenic,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget body() {
    return SafeArea(
      child: Column(
        children: [
          Constants.verticalBox20,
          Container(
            width: DeviceHelper.shared.getWidth(context),
            margin: const EdgeInsets.symmetric(
              horizontal: Dimens.size10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButtonIconWidget(
                  iconPath: Assets.icons.icAdd.path,
                  title: S.current.join,
                ),
                CustomButtonIconWidget(
                  iconPath: Assets.icons.icMeeting.path,
                  title: S.current.new_meeting,
                  bgColor: AppColors.beer,
                  onTap: () => NavigationService.instance.navigateToScreen(
                    const NewMeetingPage(),
                  ),
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
                    color: AppColors.aliceBlue,
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
