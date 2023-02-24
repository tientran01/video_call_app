import 'package:video_call_app/components/strings.dart';
import 'package:video_call_app/pages/team_chat/screen.dart';

class CircleIconButtonWidget extends StatelessWidget {
  final String iconPath;
  final Color iconColor;
  final Color bgColor;
  final VoidCallback onPressed;
  final double iconSize;
  final String? title;
  final Color fontColor;

  const CircleIconButtonWidget({
    Key? key,
    required this.iconPath,
    this.iconColor = Colors.blue,
    this.bgColor = Colors.white,
    required this.onPressed,
    this.iconSize = Dimens.size25,
    this.title,
    this.fontColor = AppColors.arsenic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RawMaterialButton(
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          fillColor: bgColor,
          shape: const CircleBorder(),
          padding: Constants.edgeInsetsAll15,
          onPressed: onPressed,
          child: Image.asset(
            iconPath,
            width: iconSize,
            color: iconColor,
          ),
        ),
        (title == Strings.empty)
            ? Constants.emptyBox
            : Padding(
                padding: Constants.edgeVertical10,
                child: TextView(
                  text: title ?? '',
                  fontColor: fontColor,
                ),
              ),
      ],
    );
  }
}
