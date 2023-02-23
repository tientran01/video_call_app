import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:video_call_app/pages/meetings/screen.dart';
import 'package:video_call_app/pages/meetings/widget/infor_meeting_widget.dart';
import 'package:video_call_app/pages/meetings/widget/tool_bar_bottom_widget.dart';
import 'package:video_call_app/pages/meetings/widget/leave_meeting_widget.dart';

import '../base/loading_widget.dart';

class JoinMeetingPage extends BaseScreen {
  const JoinMeetingPage({Key? key}) : super(key: key);

  @override
  JoinMeetingPageState createState() => JoinMeetingPageState();
}

class JoinMeetingPageState extends BaseScreenState<JoinMeetingPage>
    with TickerProviderStateMixin {
  late RtcEngine _engine;
  int? _remoteUid;
  bool _localUserJoined = false;
  bool muted = false;
  bool expanded = true;

  @override
  LeadingButtonType leadingButtonType() => LeadingButtonType.backIcon;

  @override
  ActionButtonType actionButtonType() => ActionButtonType.actionText;

  @override
  bool isNormalAppBar() => false;

  @override
  Color bgActionText() => Colors.red;

  @override
  String actionText() => S.current.end;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  void dispose() {
    _engine.leaveChannel();
    super.dispose();
  }

  @override
  void onTapAction() => NavigationService.instance.showBottomSheet(
        child: LeaveMeetingWidget(
          engine: _engine,
        ),
        context: context,
        isScrollControlled: true,
      );

  @override
  Widget appBarWidget() => InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          NavigationService.instance.showBottomSheet(
            child: const InforMeetingWidget(),
            context: context,
          );
        },
        child: Padding(
          padding: Constants.edgeInsetsAll15,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextView(
                text: S.current.account,
                fontColor: AppColors.blue,
              ),
              Constants.horizontalBox5,
              Assets.icons.icArrowDown.image(
                width: Dimens.size15,
                color: AppColors.blue,
              ),
            ],
          ),
        ),
      );

  Future<void> initialize() async {
    await [Permission.microphone, Permission.camera].request();
    _engine = createAgoraRtcEngine();
    await _engine.initialize(
      const RtcEngineContext(
        appId: Strings.appID,
        channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
      ),
    );
    _engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          setState(() {
            _localUserJoined = true;
          });
        },
        onUserJoined: (
          RtcConnection connection,
          int remoteUid,
          int elapsed,
        ) {
          setState(() {
            _remoteUid = remoteUid;
          });
        },
        onUserOffline: (
          RtcConnection connection,
          int remoteUid,
          UserOfflineReasonType reason,
        ) {
          setState(() {
            _remoteUid = null;
          });
        },
        onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
          _engine.renewToken(token);
        },
      ),
    );

    await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await _engine.enableVideo();
    await _engine.startPreview();

    await _engine.joinChannel(
      token: Strings.token,
      channelId: '11110000',
      uid: 0,
      options: const ChannelMediaOptions(),
    );
  }

  @override
  Widget body() {
    return Stack(
      children: [
        Center(
          child: _localUserJoined
              ? AgoraVideoView(
                  controller: VideoViewController(
                    rtcEngine: _engine,
                    canvas: const VideoCanvas(uid: 0),
                  ),
                )
              : const LoadingWidget(),
        ),
        const Positioned(
          left: Dimens.size0,
          right: Dimens.size0,
          bottom: Dimens.size0,
          child: ToolBarBottomWidget(
            // engine: _engine,
          ),
        ),
      ],
    );
  }
}
