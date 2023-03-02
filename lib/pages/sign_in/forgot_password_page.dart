import 'package:video_call_app/components/strings.dart';
import 'package:video_call_app/pages/team_chat/screen.dart';
import 'package:video_call_app/pages/widget/text_form_field.dart';

class ForgotPasswordPage extends BaseScreen {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  ForgotPasswordPageState createState() => ForgotPasswordPageState();
}

class ForgotPasswordPageState extends BaseScreenState<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  String _emailValue = Strings.empty;
  @override
  String title() => S.current.forgot_password;

  @override
  LeadingButtonType leadingButtonType() => LeadingButtonType.backIcon;

  @override
  Widget body() => Padding(
        padding: Constants.edgeHorizontal15,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Constants.verticalBox20,
            TextView(
              text: S.current.enter_your_email_address,
              upperCaseText: true,
            ),
            Constants.verticalBox10,
            CustomTextFormField(
              typeInputTextField: TypeInputTextField.email,
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
                          _emailValue = Strings.empty;
                        });
                      },
                      icon: Assets.icons.icCancel.image(
                        color: AppColors.oldSilver.withOpacity(Dimens.opacity4),
                        width: Dimens.size20,
                      ),
                    )
                  : Constants.emptyBox,
            ),
            Constants.verticalBox10,
            CustomButton(
              title: S.current.send,
              bgColor: AppColors.blue,
            ),
          ],
        ),
      );
}
