// ignore_for_file: library_prefixes

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'screen.dart';

class CallPage extends BaseScreen {
  final String channelName;
  final ClientRole clientRoleType;
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
    rtcEngine.destroy();
    super.dispose();
  }

  Future<void> initialize() async {
    if (Strings.appID.isEmpty) {
      setState(() {
        _infoString.add("1");
      });
      return;
    }
    rtcEngine = await RtcEngine.create(Strings.appID);
    await rtcEngine.enableVideo();
    await rtcEngine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await rtcEngine.setClientRole(widget.clientRoleType);
    _addAgoraEventHandle();
    VideoEncoderConfiguration configuration = VideoEncoderConfiguration();
    await rtcEngine.setVideoEncoderConfiguration(configuration);
    await rtcEngine.joinChannel(Strings.token, widget.channelName, null, 0);
  }

  void _addAgoraEventHandle() {
    rtcEngine.setEventHandler(
      RtcEngineEventHandler(
        joinChannelSuccess: (channel, uid, elapsed) {
          setState(() {
            final info = "Join channel $channel, uid: $uid";
            _infoString.add(info);
          });
        },
        leaveChannel: (stats) {
          setState(() {
            _infoString.add("Leave Channel");
            _users.clear();
          });
        },
        userJoined: (uid, elapsed) {
          final info = "User joined: $uid";
          _infoString.add(info);
          _users.add(uid);
        },
        userOffline: (uid, reason) {
          setState(() {
            final info = 'User offline: $uid';
            _infoString.add(info);
            _users.remove(uid);
          });
        },
      ),
    );
  }

  Widget _viewRow() {
    final List<StatefulWidget> list = [];
    if (widget.clientRoleType == ClientRole.Broadcaster) {
      list.add(const RtcLocalView.SurfaceView());
    }
    // for (var uid in _users) {
    //   list.add(RtcLocalView.SurfaceView(
    //     channelId: widget.channelName,
        
    //   ));
    // }
    final views = list;
    return Column(
      children: List.generate(
        views.length,
        (index) => Expanded(
          child: views[index],
        ),
      ),
    );
  }

  @override
  Widget body() {
    return Center(
      child: Stack(
        children: [
          _viewRow(),
          _toolBar(),
        ],
      ),
    );
  }

  Widget _toolBar() {
    if (widget.clientRoleType == ClientRole.Audience) return Constants.emptyBox;
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
