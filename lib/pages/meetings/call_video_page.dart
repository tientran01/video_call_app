import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:video_call_app/pages/base/loading_widget.dart';
import 'package:video_call_app/pages/meetings/screen.dart';
import 'package:video_call_app/pages/meetings/widget/participant_people_widget.dart';
import 'package:video_call_app/pages/meetings/widget/tool_bar_item_widget.dart';

class CallVideoPage extends BaseScreen {
  final String channelID;
  final ClientRoleType roleType;
  const CallVideoPage({
    super.key,
    required this.channelID,
    this.roleType = ClientRoleType.clientRoleBroadcaster,
  });

  @override
  CallVideoPageState createState() => CallVideoPageState();
}

class CallVideoPageState extends BaseScreenState<CallVideoPage> {
  late RtcEngine _engine;
  int? _remoteUid;
  bool _localUserJoined = false;
  bool muted = false;
  int numberOfPeopleInThisChannel = 0;

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
          if (mounted) {
            setState(() {
              _localUserJoined = true;
              numberOfPeopleInThisChannel = numberOfPeopleInThisChannel + 1;
            });
          }
        },
        onUserJoined: (
          RtcConnection connection,
          int remoteUid,
          int elapsed,
        ) {
          if (mounted) {
            setState(() {
              _remoteUid = remoteUid;
              numberOfPeopleInThisChannel = numberOfPeopleInThisChannel + 1;
            });
          }
        },
        onUserOffline: (
          RtcConnection connection,
          int remoteUid,
          UserOfflineReasonType reason,
        ) {
          if (mounted) {
            setState(() {
              _remoteUid = null;
            });
          }
        },
        onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
          _engine.renewToken(token);
        },
        onLeaveChannel: (connection, stats) {
          setState(() {
            numberOfPeopleInThisChannel = numberOfPeopleInThisChannel - 1;
          });
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
          Center(
            child: _remoteVideo(),
          ),
          Positioned(
            top: Dimens.size50,
            left: Dimens.size20,
            child: Container(
              margin: Constants.edgeVertical20,
              decoration: BoxDecoration(
                color: AppColors.brightGray.withOpacity(
                  Dimens.opacity4,
                ),
              ),
              width: Dimens.size100,
              height: Dimens.size150,
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
          Positioned(
            bottom: Dimens.size0,
            left: Dimens.size0,
            right: Dimens.size0,
            child: Container(
              width: DeviceHelper.shared.getWidth(context),
              padding: Constants.edgeRL15T5B20,
              decoration: const BoxDecoration(
                color: AppColors.aliceBlue,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ToolBarItemWidget(
                    iconPath: muted
                        ? Assets.icons.icMicOff.path
                        : Assets.icons.icMic.path,
                    title: muted ? S.current.mute : S.current.unmute,
                    onTap: () {
                      if (mounted) {
                        setState(() {
                          muted = !muted;
                        });
                      }
                      _engine.muteLocalAudioStream(muted);
                    },
                    iconColor: muted ? Colors.red : AppColors.blue,
                    fontColor: muted ? Colors.red : AppColors.blue,
                  ),
                  ToolBarItemWidget(
                    iconPath: Assets.icons.icSwitchCamera.path,
                    title: S.current.switch_camera,
                    onTap: () {
                      _engine.switchCamera();
                    },
                  ),
                  ToolBarItemWidget(
                    title: S.current.end,
                    iconPath: Assets.icons.icCall.path,
                    iconColor: Colors.red,
                    fontColor: Colors.red,
                    onTap: () {
                      _engine.leaveChannel();
                      NavigationService.instance.goBack();
                    },
                  ),
                  ToolBarItemWidget(
                    iconPath: Assets.icons.icParticipants.path,
                    title: S.current.participant,
                    onTap: () => NavigationService.instance.navigateToScreen(
                      ParticipantPeopleWidget(
                        numberOfPeopleInThisChannel:
                            numberOfPeopleInThisChannel,
                      ),
                    ),
                  ),
                  ToolBarItemWidget(
                    iconPath: Assets.icons.icMore.path,
                    title: S.current.more,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool isBackgroundColor() => false;

  @override
  void onLeadingAction() {
    _engine.leaveChannel();
    NavigationService.instance.goBack();
  }

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
