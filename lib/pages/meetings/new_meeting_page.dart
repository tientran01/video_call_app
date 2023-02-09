import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_call_app/pages/meetings/call_page.dart';

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
            TextFormField(
              keyboardType: TextInputType.number,
              controller: _channelController,
              autofocus: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade300,
                hintText: S.current.meeting_id,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimens.size15),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: Dimens.size15,
                  vertical: Dimens.size20,
                ),
                errorText: _validateError ? "Channel name is Tieng" : null,
              ),
            ),
            Constants.verticalBox30,
            CustomButtom(
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
      NavigationService.instance.navigateToScreen(
        CallPage(
          channelName: _channelController.text,
          clientRoleType: clientRoleType,
        ),
      );
    }
  }
}
