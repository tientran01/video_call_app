import 'package:video_call_app/pages/contacts/country_page.dart';

import 'screen.dart';

class ConnectPhonePage extends BaseScreen {
  const ConnectPhonePage({Key? key}) : super(key: key);

  @override
  ConnectPhonePageState createState() => ConnectPhonePageState();
}

class ConnectPhonePageState extends BaseScreenState<ConnectPhonePage> {
  TextEditingController phoneEditingController = TextEditingController();
  @override
  LeadingButtonType leadingButtonType() => LeadingButtonType.backText;

  @override
  String title() => S.current.phone_contacts_matching;

  @override
  Widget body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Constants.verticalBox20,
        Padding(
          padding: Constants.edgeHori15Verti10,
          child: TextView(
            text: S.current.add_your_phone_number.toUpperCase(),
            fontColor: AppColors.oldSilver,
            fontSize: Dimens.size18,
          ),
        ),
        SizedBox(
          width: DeviceHelper.shared.getWidth(context),
          child: Column(
            children: [
              Container(
                width: DeviceHelper.shared.getWidth(context),
                padding: Constants.edgeHori15Verti20,
                decoration: const BoxDecoration(
                  color: AppColors.brightGray,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        onTap: () =>
                            NavigationService.instance.navigateToScreen(
                          const CountryPage(),
                        ),
                        child: Row(
                          children: const [
                            TextView(
                              text: '+84',
                            ),
                            Constants.horizontalBox10,
                            TextView(text: 'Vietnam'),
                          ],
                        ),
                      ),
                    ),
                    Assets.icons.icArrowRight.image(
                      width: Dimens.size20,
                      color: AppColors.oldSilver,
                    ),
                  ],
                ),
              ),
              Constants.verticalBox5,
              CustomTextFormField(
                textEditingController: phoneEditingController,
                hintText: S.current.phone_number,
                typeInputTextField: TypeInputTextField.phoneNumber,
                isBorderRadius: true,
                suffixWidgetType: SuffixWidgetTextField.suffixIconClear,
              ),
            ],
          ),
        ),
        Container(
          width: DeviceHelper.shared.getWidth(context),
          alignment: Alignment.center,
          padding: Constants.edgeInsetsAll20,
          child: CustomButton(
            title: S.current.continue_,
            bgColor: AppColors.blue,
            width: DeviceHelper.shared.getWidth(context),
          ),
        ),
      ],
    );
  }
}
