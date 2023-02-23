import 'package:flutter/material.dart';
import 'package:video_call_app/components/app_colors.dart';
import 'package:video_call_app/components/enums.dart';
import 'package:video_call_app/components/strings.dart';
import 'package:video_call_app/pages/base/app_bar_normal.dart';
import '../../components/dimens.dart';
import '../widget/text_view.dart';

abstract class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);
}

class BaseScreenState<Page extends BaseScreen> extends State<Page>
    with WidgetsBindingObserver {
  ActionButtonType actionButtonType() => ActionButtonType.actionNone;

  LeadingButtonType leadingButtonType() => LeadingButtonType.none;

  bool isNormalAppBar() => true;

  bool isBackgroundColor() => true;

  Widget appBarWidget() {
    throw UnimplementedError();
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

  String actionText() => Strings.empty;

  Color bgActionText() => AppColors.blue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: isBackgroundColor()
            ? AppBar(
                automaticallyImplyLeading: false,
                elevation: Dimens.size0,
                backgroundColor: isBackgroundColor()
                    ? AppColors.aliceBlue
                    : Colors.transparent,
                centerTitle: true,
                title: AppBarNormal(
                  actionButtonType: actionButtonType(),
                  leadingButtonType: leadingButtonType(),
                  onTapAction: onTapAction,
                  actionText: actionText(),
                  bgActionText: bgActionText(),
                  child: isNormalAppBar()
                      ? TextView(
                          text: title(),
                        )
                      : appBarWidget(),
                ),
              )
            : null,
        body: body(),
      ),
    );
  }

  Widget body() {
    throw UnimplementedError();
  }

  void onTapAction() {}
}
