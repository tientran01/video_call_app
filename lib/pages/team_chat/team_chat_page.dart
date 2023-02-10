import 'screen.dart';

class TeamChatPage extends BaseScreen {
  const TeamChatPage({Key? key}) : super(key: key);

  @override
  TeamChatPageState createState() => TeamChatPageState();
}

class TeamChatPageState extends BaseScreenState<TeamChatPage> {
  @override
  ActionButtonType actionButtonType() => ActionButtonType.actionCreate;

  @override
  String title() => S.current.team_chat;

  @override
  Widget body() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Assets.icons.icTeamChat.image(
            width: Dimens.size100,
            color: Colors.white,
          ),
          Constants.verticalBox30,
          TextView(
            text: S.current.find_people,
            fontSize: Dimens.size18,
            fontWeight: FontWeight.w500,
          ),
          Constants.verticalBox20,
          CustomButton(
            bgColor: AppColors.blue,
            title: S.current.add_contacts,
          ),
        ],
      ),
    );
  }
}
