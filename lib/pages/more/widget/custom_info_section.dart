import 'package:video_call_app/pages/contacts/screen.dart';
import 'package:video_call_app/pages/more/my_profile_page.dart';

class CustomInfoSection extends StatelessWidget {
  const CustomInfoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => NavigationService.instance.navigateToScreen(
        const MyProfilePage(),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.size10,
          vertical: Dimens.size20,
        ),
        width: DeviceHelper.shared.getWidth(context),
        decoration: BoxDecoration(
          color: AppColors.arsenic,
          borderRadius: BorderRadius.circular(
            Dimens.size15,
          ),
          shape: BoxShape.rectangle,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: Constants.edgeInsetsAll10,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    Dimens.size15,
                  ),
                ),
                child: Assets.icons.icUser.image(
                  width: Dimens.size35,
                ),
              ),
            ),
            Constants.horizontalBox10,
            Expanded(
              flex: Dimens.size5.toInt(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  TextView(
                    text: "Tran Thi Anh Tien",
                    fontSize: Dimens.size20,
                  ),
                  Constants.verticalBox5,
                  TextView(
                    text: 'anhtien@gmail.com',
                    fontSize: Dimens.size15,
                    fontColor: AppColors.oldSilver,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: () {},
                icon: Assets.icons.icArrowRight.image(
                  width: Dimens.size25,
                  color: AppColors.oldSilver,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
