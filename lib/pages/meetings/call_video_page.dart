// ignore_for_file: avoid_print

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_call_app/components/strings.dart';
import 'package:video_call_app/pages/base/loading_widget.dart';
import 'package:video_call_app/pages/team_chat/screen.dart';
import 'package:video_call_app/route/navigation_service.dart';

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
        onConnectionStateChanged: (connection, state, reason) {
          print("reson========== ${reason.toString()}");
          _engine.renewToken(
              "007eJxTYFipXNxaNevMFampqbNu/L99vPJN+bdOn6zFgq5865RnKwQqMBgZmJilGhiZJxuYmZkYWyYmJRmam1ukmiQmWyZZpiSnTq39ktwQyMiwV2gJCyMDBIL4HAyGQGAABAwMADIdIKs=");
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
          Container(
            margin: Constants.edgeVertical20,
            alignment: Alignment.topLeft,
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
          _toolBar(),
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
              _engine.muteLocalAudioStream(muted);
            },
          ),
          _buttonIcon(
            iconPath: Assets.icons.icCall.path,
            onPressed: () {
              NavigationService.instance.goBack();
              _engine.leaveChannel();
            },
            bgColor: Colors.red.shade500,
            iconColor: Colors.white,
            iconSize: Dimens.size30,
          ),
          _buttonIcon(
            iconPath: Assets.icons.icChangeCamera.path,
            onPressed: () => _engine.switchCamera(),
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
