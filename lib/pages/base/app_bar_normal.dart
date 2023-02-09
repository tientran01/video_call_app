import 'package:flutter/material.dart';
import 'package:video_call_app/components/app_colors.dart';
import 'package:video_call_app/components/constants.dart';
import 'package:video_call_app/components/dimens.dart';
import 'package:video_call_app/components/enums.dart';
import 'package:video_call_app/configs/locale/generated/l10n.dart';
import 'package:video_call_app/gen/assets.gen.dart';
import 'package:video_call_app/pages/contacts/widget/choice_action_widget.dart';
import 'package:video_call_app/route/navigation_service.dart';

class AppBarNormal extends StatelessWidget {
  final LeadingButtonType leadingButtonType;
  final ActionButtonType actionButtonType;
  final Widget child;
  const AppBarNormal({
    Key? key,
    this.actionButtonType = ActionButtonType.actionNone,
    this.leadingButtonType = LeadingButtonType.none,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildLeadingIcon(),
        ),
        Expanded(
          flex: Dimens.size3.toInt(),
          child: Center(
            child: child,
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildActionIcon(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLeadingIcon() {
    switch (leadingButtonType) {
      case LeadingButtonType.backText:
        return InkWell(
          focusColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () => NavigationService.instance.goBack(),
          child: Text(
            S.current.cancel,
            style: const TextStyle(
              fontSize: Dimens.size17,
            ),
          ),
        );
      default:
        return Constants.emptyBox;
    }
  }

  Widget _buildActionIcon(BuildContext context) {
    switch (actionButtonType) {
      case ActionButtonType.actionInformation:
        return _actionIcon(
          iconPath: Assets.icons.icInfo.path,
          onPressed: () => _showPersonalMeetingSheet(context),
        );
      case ActionButtonType.actionCreate:
        return _actionIcon(
          iconPath: Assets.icons.icCreate.path,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => const ChoiceActionWidget(),
            );
          },
        );
      case ActionButtonType.actionAdd:
        return _actionIcon(
          iconPath: Assets.icons.icAddButton.path,
          onPressed: () {},
        );
      case ActionButtonType.actionNone:
        return Constants.emptyBox;
    }
  }

  Widget _actionIcon({
    required String iconPath,
    required VoidCallback onPressed,
  }) {
    return IconButton(
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: onPressed,
      icon: Image.asset(
        iconPath,
        width: Dimens.size25,
        color: Colors.white,
      ),
    );
  }

  void _showPersonalMeetingSheet(BuildContext context) {
    showModalBottomSheet(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 1 / 2,
      ),
      backgroundColor: AppColors.eerieBlack,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          Dimens.size20,
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.size10,
            vertical: Dimens.size20,
          ),
          child: Column(
            children: [
              Column(
                children: [
                  Text(
                    S.current.personal_metting_id,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: Dimens.size20,
                    ),
                  ),
                  Constants.verticalBox10,
                  const Text(
                    "234 444 444",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Dimens.size25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Constants.verticalBox20,
              Container(
                width: MediaQuery.of(context).size.width,
                padding: Constants.edgeInsetsAll10,
                decoration: BoxDecoration(
                  color: AppColors.raisinBlack,
                  borderRadius: BorderRadius.circular(
                    Dimens.size10,
                  ),
                ),
                child: Column(
                  children: [
                    _buildPersonalMeetingItem(
                      () {},
                      title: S.current.start_meeting,
                      iconPath: Assets.icons.icCalendar.path,
                    ),
                    _buildPersonalMeetingItem(
                      () {},
                      title: S.current.send_invitaion,
                      iconPath: Assets.icons.icSend.path,
                    ),
                    _buildPersonalMeetingItem(
                      () {},
                      title: S.current.edit_meeting,
                      iconPath: Assets.icons.icEdit.path,
                    ),
                  ],
                ),
              ),
              Constants.verticalBox10,
              InkWell(
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () => NavigationService.instance.goBack(),
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: Constants.edgeInsetsAll10,
                  child: Text(
                    S.current.cancel,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: Dimens.size17,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPersonalMeetingItem(
    VoidCallback? onTap, {
    required String title,
    required String iconPath,
  }) {
    return Container(
      padding: Constants.edgeInsetsAll10,
      child: Row(
        children: [
          Expanded(
            flex: Dimens.size3.toInt(),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: Dimens.size18,
              ),
            ),
          ),
          Expanded(
            child: IconButton(
              alignment: Alignment.bottomRight,
              onPressed: () {},
              icon: Image.asset(
                iconPath,
                width: Dimens.size25,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
