import 'package:video_call_app/components/app_colors.dart';
import 'package:video_call_app/components/constants.dart';
import 'package:video_call_app/components/dimens.dart';
import 'package:video_call_app/configs/locale/generated/l10n.dart';

import 'screen.dart';

class ContactPage extends BaseScreen {
  const ContactPage({Key? key}) : super(key: key);

  @override
  ContactPageState createState() => ContactPageState();
}

class ContactPageState extends BaseScreenState<ContactPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  NavigationBarItem navigationBarItem() => NavigationBarItem.contacts;

  @override
  ActionButtonType actionButtonType() => ActionButtonType.actionAdd;

  @override
  bool isNormalAppBar() => false;

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
        unselectedLabelColor: Colors.black,
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
    return Container();
  }
}
