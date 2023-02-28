import 'package:google_fonts/google_fonts.dart';
import 'package:video_call_app/pages/widget/no_splash_widget.dart';

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
        padding: Constants.edgeHorizontal15,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Constants.verticalBox10,
            TextView(
              text: S.current.personal_metting_id,
              fontWeight: FontWeight.w800,
              fontSize: Dimens.size17,
            ),
            Constants.verticalBox10,
            Text(
              Strings.channelName,
              style: GoogleFonts.lato(
                fontSize: Dimens.size28,
                color: AppColors.blue,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: Constants.edgeInsetsAll15,
              child: Column(
                children: [
                  _buildPersonalMeetingItem(
                    () {},
                    title: S.current.start_meeting,
                    iconPath: Assets.icons.icCalendar.path,
                  ),
                  Constants.dividerCustom(),
                  _buildPersonalMeetingItem(
                    () {},
                    title: S.current.send_invitaion,
                    iconPath: Assets.icons.icSend.path,
                  ),
                  Constants.dividerCustom(),
                  _buildPersonalMeetingItem(
                    () {},
                    title: S.current.edit_meeting,
                    iconPath: Assets.icons.icEdit.path,
                  ),
                ],
              ),
            ),
            Constants.verticalBox10,
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
            child: NoSplashWidget(
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
                  onTap: () => NavigationService.instance.navigateToScreen(
                    const JoinMeetingPage(),
                  ),
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
