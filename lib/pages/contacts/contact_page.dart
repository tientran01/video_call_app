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
      width: DeviceHelper.shared.getWidth(context),
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
    return Stack(
      children: [
        TabBarView(
          controller: _tabController,
          children: const [
            MyContactPage(),
            ChannelPage(),
          ],
        ),
        const Positioned(
          right: Dimens.size15,
          child: ChoiceActionWidget(),
        ),
      ],
    );
  }
}
