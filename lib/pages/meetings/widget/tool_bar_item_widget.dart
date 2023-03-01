import 'widget.dart';

class ToolBarItemWidget extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback? onTap;
  final Color iconColor;
  final Color fontColor;
  const ToolBarItemWidget({
    Key? key,
    required this.title,
    required this.iconPath,
    this.onTap,
    this.iconColor = AppColors.blue,
    this.fontColor = AppColors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceHelper.shared.getWidth(context) / Dimens.size5,
      padding: Constants.edgeVertical5,
      child: NoSplashWidget(
        child: InkWell(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                iconPath,
                width: Dimens.size20,
                color: iconColor,
              ),
              TextView(
                text: title,
                fontColor: fontColor,
                fontSize: Dimens.size10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
