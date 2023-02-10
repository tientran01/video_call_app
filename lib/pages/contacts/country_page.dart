import 'package:video_call_app/pages/team_chat/screen.dart';

class CountryPage extends BaseScreen {
  const CountryPage({super.key});

  @override
  CountryPageState createState() => CountryPageState();
}

class CountryPageState extends BaseScreenState<CountryPage> {
  @override
  LeadingButtonType leadingButtonType() => LeadingButtonType.backIcon;
  @override
  String title() => S.current.country_region_codes;
  @override
  Widget body() {
    return Container();
  }
}
