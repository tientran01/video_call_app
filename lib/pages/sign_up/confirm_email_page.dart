import 'package:video_call_app/components/device_helper.dart';
import 'package:video_call_app/components/strings.dart';
import 'package:video_call_app/pages/team_chat/screen.dart';
import 'package:video_call_app/pages/widget/text_form_field.dart';

class ConfirmEmailPage extends BaseScreen {
  const ConfirmEmailPage({Key? key}) : super(key: key);

  @override
  ConfirmEmailPageState createState() => ConfirmEmailPageState();
}

class ConfirmEmailPageState extends BaseScreenState<ConfirmEmailPage> {
  final TextEditingController _emailController = TextEditingController();
  @override
  String title() => S.current.sign_up;

  @override
  LeadingButtonType leadingButtonType() => LeadingButtonType.backIcon;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget body() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: DeviceHelper.shared.getHeight(context),
        ),
        padding: Constants.edgeHori15Verti20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              text: S.current.enter_your_email_address.toUpperCase(),
              fontSize: Dimens.size18,
              fontColor: AppColors.oldSilver,
            ),
            Constants.verticalBox10,
            CustomTextFormField(
              textEditingController: _emailController,
              hintText: Strings.hintTextEmail,
              prefixWidgetType: PrefixWidgetTextField.prefixText,
              textPrefix: S.current.email,
              suffixWidgetType: SuffixWidgetTextField.suffixIconClear,
              typeInputTextField: TypeInputTextField.email,
            ),
            Constants.verticalBox20,
            CustomButton(
              title: S.current.continue_,
            ),
            Constants.verticalBox50,
            TextView(
              text: S.current.select_your_sign_up_method.toUpperCase(),
              fontSize: Dimens.size18,
              fontColor: AppColors.oldSilver,
            ),
            Constants.verticalBox10,
            CustomButton(
              title: S.current.continue_with_google,
              bgColor: AppColors.aliceBlue,
              fontColor: AppColors.oldSilver,
              icon: true,
              iconPath: Assets.icons.icGoogle.path,
            ),
            Constants.verticalBox10,
            CustomButton(
              title: S.current.continue_with_facebook,
              bgColor: AppColors.aliceBlue,
              fontColor: AppColors.oldSilver,
              icon: true,
              iconPath: Assets.icons.icFacebook.path,
            ),
          ],
        ),
      ),
    );
  }
}
