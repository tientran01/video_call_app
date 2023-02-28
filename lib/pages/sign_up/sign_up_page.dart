import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_call_app/bloc/sign_up/sign_up_bloc.dart';
import 'package:video_call_app/bloc/sign_up/sign_up_event.dart';
import 'package:video_call_app/bloc/sign_up/sign_up_state.dart';
import 'package:video_call_app/components/device_helper.dart';
import 'package:video_call_app/components/strings.dart';
import 'package:video_call_app/pages/team_chat/screen.dart';
import 'package:video_call_app/pages/widget/text_form_field.dart';

class SignUpPage extends BaseScreen {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends BaseScreenState<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late SignUpBloc signUpBloc;

  @override
  String title() => S.current.sign_up;

  @override
  LeadingButtonType leadingButtonType() => LeadingButtonType.backIcon;

  @override
  void initState() {
    super.initState();
    signUpBloc = SignUpBloc.of(context);
  }

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
        child: BlocBuilder<SignUpBloc, SignUpState>(
          bloc: signUpBloc,
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  text: S.current.enter_your_email_address.toUpperCase(),
                  upperCaseText: true,
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
                  onChanged: (email) => signUpBloc.add(GetEmailAndPasswordEvent(
                    email: email,
                  )),
                ),
                Constants.verticalBox10,
                CustomTextFormField(
                  textEditingController: _passwordController,
                  hintText: S.current.required,
                  prefixWidgetType: PrefixWidgetTextField.prefixText,
                  textPrefix: S.current.password,
                  typeInputTextField: TypeInputTextField.password,
                  suffixWidgetType: SuffixWidgetTextField.suffixIconClear,
                  onChanged: (value) {},
                  formatter: [
                    LengthLimitingTextInputFormatter(
                      Dimens.size10.toInt(),
                    ),
                  ],
                ),
                Constants.verticalBox20,
                CustomButton(
                  title: S.current.continue_,
                  onTap: () => signUpBloc.add(SignUpWithEmailAndPasswordEvent()),
                ),
                Constants.verticalBox50,
                TextView(
                  text: S.current.select_your_sign_up_method.toUpperCase(),
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
              ],
            );
          },
        ),
      ),
    );
  }
}
