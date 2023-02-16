import 'package:video_call_app/components/device_helper.dart';
import 'package:video_call_app/components/strings.dart';
import 'package:video_call_app/pages/sign_up/confirm_email_page.dart';
import 'package:video_call_app/pages/team_chat/screen.dart';
import 'package:video_call_app/pages/widget/text_form_field.dart';
import 'package:video_call_app/route/navigation_service.dart';

import 'screen.dart';

class SignUpPage extends BaseScreen {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends BaseScreenState<SignUpPage> {
  @override
  LeadingButtonType leadingButtonType() => LeadingButtonType.backText;

  @override
  String title() => S.current.sign_up;

  @override
  Widget body() => Padding(
        padding: Constants.edgeHori15Verti20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              text: S.current.verify_your_age.toUpperCase(),
              fontSize: Dimens.size20,
            ),
            Constants.verticalBox10,
            CustomTextFormField(
              textEditingController: TextEditingController(),
              hintText: Strings.splash,
              prefixWidgetType: PrefixWidgetTextField.prefixText,
              textPrefix: S.current.birth_year,
              typeInputTextField: TypeInputTextField.phoneNumber,
            ),
            Constants.verticalBox10,
            TextView(
              text: S.current.please_confirm_your_birth_year,
              fontSize: Dimens.size20,
              fontColor: AppColors.oldSilver,
            ),
            Constants.verticalBox20,
            CustomButton(
              title: S.current.continue_,
              onTap: () => NavigationService.instance.navigateToScreen(
                const ConfirmEmailPage(),
              ),
            ),
          ],
        ),
      );
}
