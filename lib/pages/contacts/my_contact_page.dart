import 'screen.dart';

class MyContactPage extends StatefulWidget {

  const MyContactPage({Key? key}) : super(key: key);

  @override
  State<MyContactPage> createState() => _MyContactPageState();
}

class _MyContactPageState extends State<MyContactPage> {
  TextEditingController searchEditingController = TextEditingController();

  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.edgeInsetsAll15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
            textEditingController: searchEditingController,
            hintText: S.current.search_contacts,
            prefixIcon: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              focusColor: Colors.transparent,
              onPressed: () {},
              icon: Assets.icons.icSearch.image(
                color: AppColors.oldSilver,
              ),
            ),
            validateError: false,
            suffixIcon: (searchText.isNotEmpty ||
                    searchEditingController.text.isNotEmpty)
                ? IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    onPressed: () {
                      searchEditingController.clear();
                      setState(() {
                        searchText = Strings.splash;
                      });
                    },
                    icon: Assets.icons.icClear.image(
                      color: AppColors.oldSilver,
                      width: Dimens.size25,
                    ),
                  )
                : Constants.emptyBox,
            onChanged: (value) {
              setState(() {
                searchText = value;
                searchText = searchEditingController.text;
              });
            },
          ),
          Constants.verticalBox30,
          TextView(
            text: S.current.my_contacts,
            fontSize: Dimens.size25,
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => NavigationService.instance
                .navigateToScreen(const ConnectPhonePage()),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomButtonIconWidget(
                  iconPath: Assets.icons.icUser.path,
                  bgColor: AppColors.blue,
                ),
                TextView(
                  text: S.current.connect_phone_contacts,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
