import 'package:flutter/material.dart';
import 'package:video_call_app/components/constants.dart';
import 'package:video_call_app/pages/base/base_screen.dart';
import 'package:video_call_app/pages/more/widget/custom_info_section.dart';

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
    return Padding(
      padding: Constants.edgeHorizontal15,
      child: Column(
        children: const [
          Constants.verticalBox20,
          CustomInfoSection(),
        ],
      ),
    );
  }
}
