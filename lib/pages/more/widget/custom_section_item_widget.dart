import 'package:video_call_app/pages/contacts/screen.dart';

class CustomSectionItemWidget extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback? onTap;
  const CustomSectionItemWidget({
    Key? key,
    required this.iconPath,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: Constants.edgeHori15Verti20,
        child: Row(
          children: [
            Image.asset(
              iconPath,
              width: Dimens.size25,
              color: AppColors.oldSilver,
            ),
            Constants.horizontalBox10,
            TextView(
              text: title,
            ),
          ],
        ),
      ),
    );
  }
}
