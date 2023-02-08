import 'screen.dart';

class TeamChatPage extends BaseScreen {
  const TeamChatPage({Key? key}) : super(key: key);

  @override
  TeamChatPageState createState() => TeamChatPageState();
}

class TeamChatPageState extends BaseScreenState<TeamChatPage> {
  @override
  NavigationBarItem navigationBarItem() => NavigationBarItem.teamChat;

  @override
  ActionButtonType actionButtonType() => ActionButtonType.actionCreate;

  @override
  Widget body() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.icons.icTeamChat.image(
            width: Dimens.size100,
            color: Colors.white,
          ),
          Constants.verticalBox30,
          Text(
            S.current.find_people,
            style: const TextStyle(
              color: Colors.white,
              fontSize: Dimens.size18,
              fontWeight: FontWeight.w500,
            ),
          ),
          Constants.verticalBox20,
          CustomButtom(
            bgColor: AppColors.blue,
            title: S.current.add_contacts,
          ),
        ],
      ),
    );
  }
}
