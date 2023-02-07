import 'package:flutter/material.dart';
import 'package:video_call_app/components/app_colors.dart';
import 'package:video_call_app/components/dimens.dart';
import 'package:video_call_app/configs/locale/generated/l10n.dart';
import 'package:video_call_app/pages/meetings/meeting_page.dart';

import '../../gen/assets.gen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final _selectedItemColor = Colors.white;
  final _unselectedItemColor = AppColors.oldSilver;

  final _buildBody = const <Widget>[
    MeetingPage(),
    ColoredBox(color: Colors.red),
    ColoredBox(color: Colors.amber),
    MeetingPage(),
  ];

  Color _getItemColor(int index) =>
      (_currentIndex == index) ? _selectedItemColor : _unselectedItemColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: Dimens.size0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Assets.icons.icInfo.image(
              width: Dimens.size25,
            ),
          ),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _buildBody,
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: onTabTapped,
      selectedItemColor: Colors.white,
      unselectedItemColor: AppColors.oldSilver,
      backgroundColor: Colors.black,
      elevation: Dimens.size0,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      items: <BottomNavigationBarItem>[
        _bottomNavigationBarItem(
          iconPath: Assets.icons.icMeeting.path,
          label: S.current.meetings,
          index: 0,
        ),
        _bottomNavigationBarItem(
          iconPath: Assets.icons.icChat.path,
          label: S.current.team_chat,
          index: 1,
        ),
        _bottomNavigationBarItem(
          iconPath: Assets.icons.icContact.path,
          label: S.current.contacts,
          index: 2,
        ),
        _bottomNavigationBarItem(
          iconPath: Assets.icons.icMore.path,
          label: S.current.more,
          index: 3,
        ),
      ],
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem({
    required String iconPath,
    required String label,
    required int index,
  }) =>
      BottomNavigationBarItem(
        icon: Image.asset(
          iconPath,
          width: Dimens.size25,
          color: _getItemColor(index),
        ),
        label: label,
      );
}
