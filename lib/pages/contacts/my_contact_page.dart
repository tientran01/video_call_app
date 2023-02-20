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
            prefixWidgetType: PrefixWidgetTextField.prefixIcon,
            iconPrefixPath: Assets.icons.icSearch.path,
            suffixIcon: (searchText.isNotEmpty ||
                    searchEditingController.text.isNotEmpty)
                ? IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    onPressed: () {
                      searchEditingController.clear();
                      setState(() {
                        searchText = Strings.empty;
                      });
                    },
                    icon: Assets.icons.icCancel.image(
                      color: AppColors.oldSilver.withOpacity(Dimens.opacity4),
                      width: Dimens.size20,
                    ),
                  )
                : Constants.emptyBox,
            onChanged: (value) {
              setState(() {
                searchText = value;
                searchText = searchEditingController.text;
              });
            },
            suffixWidgetType: SuffixWidgetTextField.suffixIconClear,
          ),
          Constants.verticalBox20,
          TextView(
            text: S.current.my_contacts,
            fontSize: Dimens.size30,
            fontWeight: FontWeight.w600,
          ),
          Constants.verticalBox10,
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
                Constants.horizontalBox10,
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
