import 'package:video_call_app/pages/contacts/screen.dart';

class MyProfilePage extends BaseScreen {
  const MyProfilePage({super.key});

  @override
  MyProfilePageState createState() => MyProfilePageState();
}

class MyProfilePageState extends BaseScreenState<MyProfilePage> {
  @override
  String title() => S.current.my_profile;
  @override
  LeadingButtonType leadingButtonType() => LeadingButtonType.backIcon;
  @override
  Widget body() {
    return Container();
  }
}
