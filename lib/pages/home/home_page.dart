import 'package:google_fonts/google_fonts.dart';

import 'screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final _selectedItemColor = AppColors.blue;
  final _unselectedItemColor = AppColors.oldSilver;

  final _buildBody = const <Widget>[
    MeetingPage(),
    TeamChatPage(),
    ContactPage(),
    MorePage(),
  ];

  Color _getItemColor(int index) =>
      (_currentIndex == index) ? _selectedItemColor : _unselectedItemColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.arsenic,
      body: IndexedStack(
        index: _currentIndex,
        children: _buildBody,
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
        ),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: AppColors.aliceBlue,
              ),
            ),
          ),
          child: _bottomNavigationBar(),
        ),
      ),
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
      selectedItemColor: AppColors.blue,
      unselectedItemColor: AppColors.oldSilver,
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
      selectedLabelStyle: GoogleFonts.quicksand(
        fontWeight: FontWeight.w600,
        fontSize: Dimens.size12,
      ),
      unselectedLabelStyle: GoogleFonts.quicksand(
        fontWeight: FontWeight.w600,
        fontSize: Dimens.size12,
      ),
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
          width: Dimens.size20,
          color: _getItemColor(index),
        ),
        label: label,
      );
}
