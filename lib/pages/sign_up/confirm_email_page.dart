import 'package:flutter/material.dart';
import 'package:video_call_app/components/device_helper.dart';
import 'package:video_call_app/pages/team_chat/screen.dart';
import 'package:video_call_app/pages/widget/text_form_field.dart';

class ConfirmEmailPage extends BaseScreen {
  const ConfirmEmailPage({Key? key}) : super(key: key);

  @override
  ConfirmEmailPageState createState() => ConfirmEmailPageState();
}

class ConfirmEmailPageState extends BaseScreenState<ConfirmEmailPage> {
  @override
  String title() => S.current.sign_up;

  @override
  LeadingButtonType leadingButtonType() => LeadingButtonType.backIcon;

  @override
  Widget body() => SingleChildScrollView(
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
                fontSize: Dimens.size20,
              ),
              Constants.verticalBox10,
              CustomTextFormField(
                textEditingController: TextEditingController(),
                hintText: 'email@gmail.com',
                prefixWidgetType: PrefixWidgetTextField.prefixText,
                textPrefix: S.current.email,
                suffixWidgetType: SuffixWidgetTextField.suffixIconClear,
              ),
              Constants.verticalBox20,
              CustomButton(
                title: S.current.continue_,
              ),
              Constants.verticalBox30,
              TextView(
                text: S.current.select_your_sign_up_method.toUpperCase(),
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
                title: S.current.continue_with_google,
                bgColor: AppColors.aliceBlue,
                fontColor: AppColors.arsenic,
                icon: true,
                iconPath: Assets.icons.icFacebook.path,
              ),
              Spacer(
                flex: Dimens.size2.toInt(),
              ),
            ],
          ),
        ),
      );
}
