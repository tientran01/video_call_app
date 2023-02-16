import 'package:video_call_app/components/device_helper.dart';
import 'package:video_call_app/components/strings.dart';
import 'package:video_call_app/gen/assets.gen.dart';

import 'screen.dart';

class SignInPage extends BaseScreen {
  const SignInPage({Key? key}) : super(key: key);

  @override
  SignInPageState createState() => SignInPageState();
}

class SignInPageState extends BaseScreenState<SignInPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _emailValue = Strings.splash;
  String _passwordValue = Strings.splash;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  String title() => S.current.sign_in;
  @override
  LeadingButtonType leadingButtonType() => LeadingButtonType.backText;

  @override
  Widget body() => SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          constraints: BoxConstraints(
            maxHeight: DeviceHelper.shared.getHeight(context),
          ),
          padding: Constants.edgeInsetsAll15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView(
                text: S.current.enter_your_email_address.toUpperCase(),
                fontColor: AppColors.oldSilver,
                fontSize: Dimens.size20,
              ),
              Constants.verticalBox10,
              CustomTextFormField(
                textEditingController: _emailController,
                hintText: 'example@gmail.com',
                prefixWidgetType: PrefixWidgetTextField.prefixText,
                textPrefix: S.current.email,
                suffixWidgetType: SuffixWidgetTextField.suffixIconClear,
                onChanged: (value) {
                  setState(() {
                    _emailValue = value;
                    _emailValue = _emailController.text;
                  });
                },
                suffixIcon: (_emailValue.isNotEmpty ||
                        _emailController.text.isNotEmpty)
                    ? IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        onPressed: () {
                          _emailController.clear();
                          setState(() {
                            _emailValue = Strings.splash;
                          });
                        },
                        icon: Assets.icons.icCancel.image(
                          color:
                              AppColors.oldSilver.withOpacity(Dimens.opacity4),
                          width: Dimens.size20,
                        ),
                      )
                    : Constants.emptyBox,
              ),
              Constants.verticalBox10,
              CustomTextFormField(
                textEditingController: _passwordController,
                hintText: S.current.required,
                prefixWidgetType: PrefixWidgetTextField.prefixText,
                textPrefix: S.current.password,
                typeInputTextField: TypeInputTextField.phoneNumber,
                suffixWidgetType: SuffixWidgetTextField.suffixIconClear,
                onChanged: (value) {
                  setState(() {
                    _passwordValue = value;
                    _passwordValue = _passwordController.text;
                  });
                },
                suffixIcon: (_passwordValue.isNotEmpty ||
                        _passwordController.text.isNotEmpty)
                    ? IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        onPressed: () {
                          _passwordController.clear();
                          setState(() {
                            _passwordValue = Strings.splash;
                          });
                        },
                        icon: Assets.icons.icCancel.image(
                          color: AppColors.oldSilver.withOpacity(
                            Dimens.opacity4,
                          ),
                          width: Dimens.size20,
                        ),
                      )
                    : Constants.emptyBox,
              ),
              Constants.verticalBox10,
              CustomButton(
                title: S.current.sign_in,
                bgColor: AppColors.blue,
              ),
              Constants.verticalBox10,
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () => NavigationService.instance
                    .navigateToScreen(const ForgotPasswordPage()),
                child: TextView(
                  text: S.current.forgot_password + Strings.questionMark,
                  fontColor: AppColors.blue,
                ),
              ),
              const Spacer(),
              TextView(
                text: S.current.other_sign_in_methods.toUpperCase(),
                fontSize: Dimens.size20,
                fontColor: AppColors.arsenic,
              ),
              Constants.verticalBox10,
              CustomButton(
                title: S.current.continue_with_google,
                bgColor: AppColors.aliceBlue,
                fontColor: AppColors.arsenic,
                icon: true,
                iconPath: Assets.icons.icGoogle.path,
              ),
              Constants.verticalBox10,
              CustomButton(
                title: S.current.continue_with_facebook,
                bgColor: AppColors.aliceBlue,
                fontColor: AppColors.arsenic,
                icon: true,
                iconPath: Assets.icons.icFacebook.path,
              ),
              const Spacer(),
            ],
          ),
        ),
      );
}
