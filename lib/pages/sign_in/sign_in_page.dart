import 'package:flutter/services.dart';
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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _emailValue = Strings.empty;
  String _passwordValue = Strings.empty;
  final _formKey = GlobalKey<FormState>();

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
  Widget body() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: DeviceHelper.shared.getHeight(context),
        ),
        padding: Constants.edgeInsetsAll15,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Constants.verticalBox10,
            TextView(
              text: S.current.enter_your_email_address.toUpperCase(),
              fontColor: AppColors.oldSilver,
              upperCaseText: true,
            ),
            Constants.verticalBox10,
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    typeInputTextField: TypeInputTextField.email,
                    textEditingController: _emailController,
                    hintText: Strings.hintTextEmail,
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
                                _emailValue = Strings.empty;
                              });
                            },
                            icon: Assets.icons.icCancel.image(
                              color: AppColors.oldSilver
                                  .withOpacity(Dimens.opacity4),
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
                    typeInputTextField: TypeInputTextField.password,
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
                                _passwordValue = Strings.empty;
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
                    formatter: [
                      LengthLimitingTextInputFormatter(
                        Dimens.size10.toInt(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Constants.verticalBox10,
            CustomButton(
              title: S.current.sign_in,
              bgColor: AppColors.blue,
              onTap: () => _login(),
            ),
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () => NavigationService.instance
                  .navigateToScreen(const ForgotPasswordPage()),
              child: Padding(
                padding: Constants.edgeVertical20,
                child: TextView(
                  text: S.current.forgot_password + Strings.questionMark,
                  fontColor: AppColors.blue,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Constants.verticalBox50,
            TextView(
              text: S.current.other_sign_in_methods.toUpperCase(),
              upperCaseText: true,
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
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {}
  }
}
