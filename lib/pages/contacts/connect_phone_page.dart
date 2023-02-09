import 'package:flutter/material.dart';
import 'package:video_call_app/components/constants.dart';
import 'package:video_call_app/components/enums.dart';
import 'package:video_call_app/pages/base/base_screen.dart';
import 'package:video_call_app/pages/widget/custom_button.dart';
import 'package:video_call_app/pages/widget/text_form_field.dart';
import 'package:video_call_app/pages/widget/text_view.dart';

import '../../components/app_colors.dart';
import '../../components/dimens.dart';
import '../../configs/locale/generated/l10n.dart';

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
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(
                  vertical: Dimens.size20,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.arsenic,
                ),
                child: TextView(
                  text: S.current.add_a_calendar,
                  fontSize: Dimens.size15,
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
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          padding: Constants.edgeInsetsAll20,
          child: CustomButton(
            title: S.current.continue_,
            bgColor: AppColors.blue,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ],
    );
  }
}
