import 'package:google_fonts/google_fonts.dart';
import 'package:video_call_app/pages/contacts/widget/choice_action_widget.dart';

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
  String searchText = '';
  bool isShowMenu = false;

  @override
  ActionButtonType actionButtonType() => ActionButtonType.actionAdd;

  @override
  bool isNormalAppBar() => false;

  @override
  String title() => S.current.contacts;

  @override
  void onTapAction() {
    setState(() {
      isShowMenu = !isShowMenu;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget appBarWidget() {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: Container(
        padding: Constants.edgeInsetsAll3,
        height: Dimens.size45,
        width: DeviceHelper.shared.getWidth(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Dimens.size15,
          ),
        ),
        child: TabBar(
          labelColor: AppColors.arsenic,
          controller: _tabController,
          indicator: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Dimens.size15),
          ),
          labelStyle: GoogleFonts.quicksand(
            fontWeight: FontWeight.w600,
          ),
          tabs: [
            Tab(
              text: S.current.contacts,
            ),
            Tab(
              text: S.current.channels,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget body() {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        setState(() {
          isShowMenu = false;
        });
      },
      child: Stack(
        children: [
          TabBarView(
            controller: _tabController,
            children: const [
              MyContactPage(),
              ChannelPage(),
            ],
          ),
          isShowMenu
              ? const Positioned(
                  top: Dimens.size10,
                  right: Dimens.size15,
                  child: ChoiceActionWidget(),
                )
              : Constants.emptyBox,
        ],
      ),
    );
  }
}
