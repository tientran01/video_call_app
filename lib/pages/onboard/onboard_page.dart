import 'package:lottie/lottie.dart';
import 'package:video_call_app/components/device_helper.dart';
import 'package:video_call_app/pages/meetings/new_meeting_page.dart';
import 'package:video_call_app/pages/sign_in/sign_in_page.dart';
import 'package:video_call_app/pages/sign_up/sign_up_page.dart';
import 'package:video_call_app/pages/team_chat/screen.dart';
import 'package:video_call_app/route/navigation_service.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({Key? key}) : super(key: key);

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.blue,
        height: DeviceHelper.shared.getHeight(context),
        width: DeviceHelper.shared.getWidth(context),
        child: Stack(
          children: [
            Positioned(
              top: DeviceHelper.shared.getWidth(context) / Dimens.size3,
              left: Dimens.size0,
              right: Dimens.size0,
              child: Lottie.asset(
                Assets.json.videoOnboard,
                repeat: true,
                reverse: true,
                animate: true,
              ),
            ),
            Positioned(
              bottom: Dimens.size0,
              child: Container(
                padding: Constants.edgeInsetsAll15,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimens.size20),
                    topRight: Radius.circular(Dimens.size20),
                  ),
                ),
                width: DeviceHelper.shared.getWidth(context),
                child: Column(
                  children: [
                    Constants.verticalBox10,
                    TextView(
                      text: S.current.welcome,
                      fontColor: AppColors.arsenic,
                      fontSize: Dimens.size20,
                      fontWeight: FontWeight.w700,
                    ),
                    Constants.verticalBox10,
                    TextView(
                      text: S.current.get_started,
                      fontColor: AppColors.arsenic,
                    ),
                    Constants.verticalBox30,
                    CustomButton(
                      title: S.current.join_meeting,
                      bgColor: AppColors.blue,
                      onTap: () => NavigationService.instance.navigateToScreen(
                        const NewMeetingPage(),
                      ),
                    ),
                    Constants.verticalBox10,
                    CustomButton(
                      title: S.current.sign_in,
                      bgColor: AppColors.aliceBlue,
                      fontColor: AppColors.arsenic,
                      onTap: () => NavigationService.instance.navigateToScreen(
                        const SignInPage(),
                      ),
                    ),
                    Constants.verticalBox10,
                    CustomButton(
                      title: S.current.sign_up,
                      bgColor: AppColors.aliceBlue,
                      fontColor: AppColors.arsenic,
                      onTap: () => NavigationService.instance.navigateToScreen(
                        const SignUpPage(),
                      ),
                    ),
                    Constants.verticalBox20,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
