// ignore_for_file: avoid_print

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:video_call_app/pages/base/loading_widget.dart';
import 'package:video_call_app/pages/meetings/screen.dart';
import 'package:video_call_app/pages/meetings/widget/tool_bar_bottom_widget.dart';

class CallVideoPage extends BaseScreen {
  final String channelID;
  const CallVideoPage({
    super.key,
    required this.channelID,
  });

  @override
  CallVideoPageState createState() => CallVideoPageState();
}

class CallVideoPageState extends BaseScreenState<CallVideoPage> {
  late RtcEngine _engine;
  int? _remoteUid;
  bool _localUserJoined = false;
  bool muted = false;

  @override
  void initState() {
    super.initState();
    initialize();
  }

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
          print("local user ${connection.localUid} joined");
          setState(() {
            _localUserJoined = true;
          });
        },
        onUserJoined: (
          RtcConnection connection,
          int remoteUid,
          int elapsed,
        ) {
          print("remote user $remoteUid joined");
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
      channelId: widget.channelID,
      uid: 0,
      options: const ChannelMediaOptions(),
    );
  }

  @override
  void dispose() {
    _engine.leaveChannel();
    _engine.disableVideo();
    _engine.disableAudio();
    super.dispose();
  }

  @override
  Widget body() {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: DeviceHelper.shared.getHeight(context) / Dimens.size6,
            right: Dimens.size20,
            child: CustomButton(
              title: S.current.end,
              bgColor: Colors.red,
              onTap: () {
                _engine.leaveChannel();
                NavigationService.instance.goBack();
              },
            ),
          ),
          Center(
            child: _remoteVideo(),
          ),
          Positioned(
            top: Dimens.size100,
            left: Dimens.size20,
            child: Container(
              margin: Constants.edgeVertical20,
              decoration: BoxDecoration(
                color: AppColors.brightGray.withOpacity(
                  Dimens.opacity4,
                ),
                borderRadius: BorderRadius.circular(
                  Dimens.size10,
                ),
              ),
              width: 100,
              height: 150,
              child: Center(
                child: _localUserJoined
                    ? AgoraVideoView(
                        controller: VideoViewController(
                          rtcEngine: _engine,
                          canvas: const VideoCanvas(uid: 0),
                        ),
                      )
                    : const LoadingWidget(),
              ),
            ),
          ),
          const Positioned(
            bottom: Dimens.size0,
            left: Dimens.size0,
            right: Dimens.size0,
            child: ToolBarBottomWidget(
                // engine: _engine,
                ),
          ),
        ],
      ),
    );
  }

  @override
  bool isBackgroundColor() => false;

  Widget _remoteVideo() {
    if (_remoteUid != null) {
      return AgoraVideoView(
        controller: VideoViewController.remote(
          rtcEngine: _engine,
          canvas: VideoCanvas(uid: _remoteUid),
          connection: RtcConnection(
            channelId: widget.channelID,
          ),
        ),
      );
    } else {
      return const TextView(
        text: "Please wait for remote user to join",
        textAlign: TextAlign.center,
      );
    }
  }
}
