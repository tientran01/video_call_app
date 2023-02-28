import 'package:video_call_app/pages/contacts/screen.dart';

class AppBarNormal extends StatelessWidget {
  final LeadingButtonType leadingButtonType;
  final ActionButtonType actionButtonType;
  final Widget child;
  final VoidCallback? onTapAction;
  final String actionText;
  final Color bgActionText;
  final VoidCallback? onLeadingAction;
  const AppBarNormal({
    Key? key,
    this.actionButtonType = ActionButtonType.actionNone,
    this.leadingButtonType = LeadingButtonType.none,
    required this.child,
    this.onTapAction,
    this.actionText = Strings.empty,
    this.bgActionText = AppColors.blue,
    this.onLeadingAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildLeadingIcon(),
            ],
          ),
        ),
        Expanded(
          flex: Dimens.size4.toInt(),
          child: Center(
            child: child,
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildActionIcon,
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
          onTap: () => onLeadingAction?.call(),
          child: Padding(
            padding: Constants.edgeVertical10,
            child: TextView(
              text: S.current.cancel,
              fontColor: AppColors.blue,
            ),
          ),
        );
      case LeadingButtonType.backIcon:
        return InkWell(
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () => onLeadingAction?.call(),
          child: Padding(
            padding: Constants.edgeInsetsAll10,
            child: Assets.icons.icBack.image(
              width: Dimens.size25,
              color: AppColors.blue,
            ),
          ),
        );
      default:
        return Constants.emptyBox;
    }
  }

  Widget get _buildActionIcon {
    switch (actionButtonType) {
      case ActionButtonType.actionInformation:
        return _actionIcon(
          iconPath: Assets.icons.icInfo.path,
          onPressed: () => onTapAction?.call(),
        );
      case ActionButtonType.actionCreate:
        return _actionIcon(
          iconPath: Assets.icons.icCreate.path,
          onPressed: () {},
        );
      case ActionButtonType.actionAdd:
        return _actionIcon(
          iconPath: Assets.icons.icAddButton.path,
          onPressed: () => onTapAction?.call(),
        );
      case ActionButtonType.actionText:
        return InkWell(
          onTap: () => onTapAction?.call(),
          child: Container(
            padding: Constants.edgeHori15Verti10,
            decoration: BoxDecoration(
              color: bgActionText,
              borderRadius: BorderRadius.circular(
                Dimens.size10,
              ),
            ),
            child: TextView(
              text: actionText,
              fontColor: Colors.white,
            ),
          ),
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
        color: AppColors.arsenic,
      ),
    );
  }
}
