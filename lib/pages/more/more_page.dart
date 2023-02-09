import 'package:flutter/material.dart';
import 'package:video_call_app/pages/base/base_screen.dart';

import '../../configs/locale/generated/l10n.dart';

class MorePage extends BaseScreen {
  const MorePage({Key? key}) : super(key: key);

  @override
  MorePageState createState() => MorePageState();
}

class MorePageState extends BaseScreenState<MorePage> {
  @override
  String title() => S.current.more;

  @override
  Widget body() {
    return const Center(
      child: Text(
        "Hello",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
