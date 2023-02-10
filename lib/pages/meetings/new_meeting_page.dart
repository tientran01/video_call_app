import 'screen.dart';

class NewMeetingPage extends BaseScreen {
  const NewMeetingPage({Key? key}) : super(key: key);

  @override
  NewMeetingPageState createState() => NewMeetingPageState();
}

class NewMeetingPageState extends BaseScreenState<NewMeetingPage> {
  final _channelController = TextEditingController();
  bool _validateError = false;
  ClientRoleType clientRoleType = ClientRoleType.clientRoleBroadcaster;

  @override
  String title() => S.current.start_meeting;

  @override
  LeadingButtonType leadingButtonType() => LeadingButtonType.backText;

  @override
  void dispose() {
    _channelController.dispose();
    super.dispose();
  }

  @override
  Widget body() {
    return SafeArea(
      child: Padding(
        padding: Constants.edgeInsetsAll15,
        child: Column(
          children: [
            CustomTextFormField(
              textEditingController: _channelController,
              fillColor: Colors.grey.shade300,
              hintText: S.current.meeting_id,
              errorText: "Channel name is Tieng",
              validateError: _validateError,
              textInputType: TextInputType.number,
              autoFocus: true,
            ),
            Constants.verticalBox10,
            CustomButton(
              title: S.current.start_meeting,
              bgColor: AppColors.blue,
              width: MediaQuery.of(context).size.width,
              heigth: Dimens.size60,
              onTap: () => onJoin(),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onJoin() async {
    setState(() {
      _channelController.text.isEmpty
          ? (_validateError = true)
          : (_validateError = false);
    });
    if (_channelController.text.isNotEmpty) {
      await [Permission.camera, Permission.microphone].request();
      FocusManager.instance.primaryFocus?.unfocus();
      _channelController.clear();
      NavigationService.instance.navigateToScreen(
        CallPage(
          channelName: _channelController.text,
          clientRoleType: clientRoleType,
        ),
      );
    }
  }
}
