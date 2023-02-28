import 'package:flutter/material.dart';
import 'package:video_call_app/bloc/sign_up/sign_up_bloc.dart';
import 'package:video_call_app/components/app_colors.dart';
import 'package:video_call_app/components/constants.dart';
import 'package:video_call_app/components/device_helper.dart';
import 'package:video_call_app/components/dimens.dart';
import 'package:video_call_app/gen/assets.gen.dart';
import 'package:video_call_app/pages/base/base_screen.dart';
import 'package:video_call_app/pages/more/widget/custom_info_section.dart';
import 'package:video_call_app/pages/more/widget/custom_section_item_widget.dart';
import 'package:video_call_app/pages/widget/text_view.dart';

import '../../configs/locale/generated/l10n.dart';

class MorePage extends BaseScreen {
  const MorePage({Key? key}) : super(key: key);

  @override
  MorePageState createState() => MorePageState();
}

class MorePageState extends BaseScreenState<MorePage> {
  late SignUpBloc signUpBloc;

  @override
  String title() => S.current.more;

  @override
  void initState() {
    super.initState();
    signUpBloc = SignUpBloc.of(context);
  }

  @override
  Widget body() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: DeviceHelper.shared.getHeight(context),
        ),
        padding: Constants.edgeHorizontal15,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Constants.verticalBox20,
            const CustomInfoSection(),
            Constants.verticalBox30,
            _customSection(titleSection: S.current.add_contacts),
          ],
        ),
      ),
    );
  }

  Widget _customSection({required String titleSection}) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(
            text: titleSection.toUpperCase(),
            fontColor: AppColors.blue,
            fontWeight: FontWeight.w700,
            fontSize: Dimens.size13,
          ),
          Container(
            margin: Constants.edgeVertical5,
            decoration: BoxDecoration(
              color: AppColors.brightGray,
              borderRadius: BorderRadius.circular(
                Dimens.size15,
              ),
            ),
            child: Column(
              children: [
                CustomSectionItemWidget(
                  iconPath: Assets.icons.icCalendar.path,
                  title: S.current.sign_out,
                  onTap: () {},
                ),
                Constants.dividerCustom(),
                CustomSectionItemWidget(
                  iconPath: Assets.icons.icMeeting.path,
                  title: S.current.meetings,
                ),
                Constants.dividerCustom(),
                CustomSectionItemWidget(
                  iconPath: Assets.icons.icContact.path,
                  title: S.current.contacts,
                ),
              ],
            ),
          ),
        ],
      );
}
