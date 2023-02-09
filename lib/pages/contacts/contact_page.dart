import 'package:video_call_app/components/app_colors.dart';
import 'package:video_call_app/components/constants.dart';
import 'package:video_call_app/components/dimens.dart';
import 'package:video_call_app/configs/locale/generated/l10n.dart';
import 'package:video_call_app/pages/contacts/connect_phone_page.dart';
import 'package:video_call_app/pages/widget/custom_button_icon_widget.dart';
import 'package:video_call_app/pages/widget/text_form_field.dart';
import 'package:video_call_app/pages/widget/text_view.dart';
import 'package:video_call_app/route/navigation_service.dart';

import '../../gen/assets.gen.dart';
import 'screen.dart';

class ContactPage extends BaseScreen {
  const ContactPage({Key? key}) : super(key: key);

  @override
  ContactPageState createState() => ContactPageState();
}

class ContactPageState extends BaseScreenState<ContactPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  TextEditingController searchEditingController = TextEditingController();

  @override
  ActionButtonType actionButtonType() => ActionButtonType.actionAdd;

  @override
  bool isNormalAppBar() => false;

  @override
  String title() => S.current.contacts;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget appBarWidget() {
    return Container(
      padding: Constants.edgeInsetsAll3,
      height: Dimens.size45,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.raisinBlack,
        borderRadius: BorderRadius.circular(
          Dimens.size15,
        ),
      ),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          color: AppColors.arsenic,
          borderRadius: BorderRadius.circular(Dimens.size15),
        ),
        labelColor: Colors.white,
        tabs: [
          Tab(
            text: S.current.contacts,
          ),
          Tab(
            text: S.current.channels,
          ),
        ],
      ),
    );
  }

  @override
  Widget body() {
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
