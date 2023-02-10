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
        Constants.verticalBox10,
        Padding(
          padding: Constants.edgeInsetsAll20,
          child: TextView(
            text: S.current.add_your_phone_number,
            fontColor: AppColors.oldSilver,
            fontSize: Dimens.size15,
          ),
        ),
        SizedBox(
          width: DeviceHelper.shared.getWidth(context),
          child: Column(
            children: [
              Container(
                width: DeviceHelper.shared.getWidth(context),
                padding: Constants.edgeInsetsAll20,
                decoration: const BoxDecoration(
                  color: AppColors.arsenic,
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
                            TextView(text: '+84'),
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
                textInputType: TextInputType.number,
                validateError: false,
                isBorderRadius: true,
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
