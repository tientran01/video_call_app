import 'screen.dart';

class CallPage extends BaseScreen {
  final String channelName;
  final ClientRoleType clientRoleType;
  const CallPage({
    Key? key,
    required this.channelName,
    required this.clientRoleType,
  }) : super(key: key);

  @override
  CallPageState createState() => CallPageState();
}

class CallPageState extends BaseScreenState<CallPage> {
  final _users = <int>[];
  final _infoString = <String>[];
  bool muted = false;
  bool viewPanel = false;
  late RtcEngine rtcEngine;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  void dispose() {
    _users.clear();
    rtcEngine.leaveChannel();
    super.dispose();
  }

  Future<void> initialize() async {
    if (Strings.appID.isEmpty) {
      setState(() {
        _infoString.add("1");
      });
      return;
    }
    rtcEngine = createAgoraRtcEngine();
    await rtcEngine.enableVideo();
    await rtcEngine
        .setChannelProfile(ChannelProfileType.channelProfileLiveBroadcasting);
    await rtcEngine.setClientRole(role: widget.clientRoleType);
    VideoEncoderConfiguration videoEncoderConfiguration =
        const VideoEncoderConfiguration();
    // videoEncoderConfiguration.dimensions = const VideoDimensions(width: 1920, height: 1080,);
    rtcEngine.setVideoEncoderConfiguration(videoEncoderConfiguration);
    rtcEngine.joinChannel(
      token: Strings.token,
      channelId: widget.channelName,
      uid: 0,
      options: const ChannelMediaOptions(),
    );
  }

  void _handleAgoraEvent() {
    rtcEngine.registerEventHandler(
      RtcEngineEventHandler(onJoinChannelSuccess: (connection, elapsed) {
        setState(() {
          _infoString.add(
              "Join channel ${connection.channelId}, uid: ${connection.localUid}");
        });
      }, onLeaveChannel: ((connection, stats) {
        setState(() {});
      })),
    );
  }

  @override
  Widget body() {
    return Center(
      child: _toolBar(),
    );
  }

  Widget _toolBar() {
    return Container(
      padding: Constants.edgeVertical35,
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buttonIcon(
            iconPath:
                muted ? Assets.icons.icMicOff.path : Assets.icons.icMic.path,
            onPressed: () {
              setState(() {
                muted = !muted;
              });
              rtcEngine.muteLocalAudioStream(muted);
            },
          ),
          _buttonIcon(
            iconPath: Assets.icons.icCall.path,
            onPressed: () => NavigationService.instance.goBack(),
            bgColor: Colors.red.shade500,
            iconColor: Colors.white,
            iconSize: Dimens.size30,
          ),
          _buttonIcon(
            iconPath: Assets.icons.icChangeCamera.path,
            onPressed: () => rtcEngine.switchCamera(),
          ),
        ],
      ),
    );
  }

  Widget _buttonIcon({
    required String iconPath,
    Color iconColor = Colors.blue,
    Color bgColor = Colors.white,
    required VoidCallback onPressed,
    double iconSize = Dimens.size25,
  }) {
    return RawMaterialButton(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      fillColor: bgColor,
      shape: const CircleBorder(),
      padding: Constants.edgeInsetsAll15,
      onPressed: onPressed,
      child: Image.asset(
        iconPath,
        width: iconSize,
        color: iconColor,
      ),
    );
  }
}
