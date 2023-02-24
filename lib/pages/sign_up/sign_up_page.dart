import 'package:video_call_app/helper/helper_utils.dart';

import 'screen.dart';

class SignUpPage extends BaseScreen {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends BaseScreenState<SignUpPage> {
  final TextEditingController _birthController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  LeadingButtonType leadingButtonType() => LeadingButtonType.backText;

  @override
  String title() => S.current.sign_up;

  @override
  void dispose() {
    _birthController.dispose();
    super.dispose();
  }

  bool get checkValid => _formKey.currentState!.validate();

  @override
  Widget body() => Padding(
        padding: Constants.edgeHori15Verti20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              text: S.current.verify_your_age.toUpperCase(),
              fontColor: AppColors.oldSilver,
              upperCaseText: true,
            ),
            Constants.verticalBox10,
            Form(
              key: _formKey,
              child: CustomTextFormField(
                textEditingController: _birthController,
                hintText: Strings.empty,
                prefixWidgetType: PrefixWidgetTextField.prefixText,
                textPrefix: S.current.birth_year,
                typeInputTextField: TypeInputTextField.birthdayYear,
                formatter: HelperUtils.formatterNumber(
                  length: Dimens.size4.toInt(),
                ),
              ),
            ),
            Constants.verticalBox20,
            CustomButton(
              title: S.current.continue_,
              onTap: () => _continueWithBirthYear.call(),
            ),
          ],
        ),
      );

  void _continueWithBirthYear() {
    checkValid;
    if (_birthController.text.isNotEmpty) {
      NavigationService.instance.navigateToScreen(const ConfirmEmailPage());
    }
  }
}
