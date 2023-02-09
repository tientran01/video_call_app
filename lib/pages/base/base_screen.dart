import 'package:flutter/material.dart';
import 'package:video_call_app/components/app_colors.dart';
import 'package:video_call_app/components/enums.dart';
import 'package:video_call_app/configs/locale/generated/l10n.dart';
import 'package:video_call_app/gen/assets.gen.dart';
import 'package:video_call_app/pages/base/app_bar/app_bar_normal.dart';
import '../../components/dimens.dart';

abstract class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);
}

class BaseScreenState<Page extends BaseScreen> extends State<Page>
    with WidgetsBindingObserver {
  NavigationBarItem navigationBarItem() => NavigationBarItem.meetings;

  ActionButtonType actionButtonType() => ActionButtonType.actionNone;

  LeadingButtonType leadingButtonType() => LeadingButtonType.none;

  bool isNormalAppBar() => true;

  Widget appBarWidget() {
    throw UnimplementedError();
  }

  String appBarTitle(NavigationBarItem item) {
    switch (item) {
      case NavigationBarItem.meetings:
        return S.current.meetings;
      case NavigationBarItem.teamChat:
        return S.current.team_chat;
      case NavigationBarItem.contacts:
        return S.current.contacts;
      case NavigationBarItem.more:
        return S.current.more;
    }
  }

  String actionIconPath(NavigationBarItem item) {
    switch (item) {
      case NavigationBarItem.meetings:
        return Assets.icons.icInfo.path;
      case NavigationBarItem.teamChat:
        return Assets.icons.icCreate.path;
      case NavigationBarItem.contacts:
        return Assets.icons.icAdd.path;
      case NavigationBarItem.more:
        return '';
    }
  }

  String title() => '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    PaintingBinding.instance.imageCache.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: Dimens.size0,
          backgroundColor: Colors.transparent,
          title: AppBarNormal(
            actionButtonType: actionButtonType(),
            leadingButtonType: leadingButtonType(),
            child: isNormalAppBar()
                ? Text(appBarTitle(navigationBarItem()))
                : appBarWidget(),
          ),
        ),
        body: body(),
        backgroundColor: AppColors.eerieBlack,
      ),
    );
  }

  Widget body() {
    throw UnimplementedError();
  }
}
