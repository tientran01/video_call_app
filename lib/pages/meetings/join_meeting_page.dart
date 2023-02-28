import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:video_call_app/pages/base/loading_widget.dart';
import 'package:video_call_app/pages/meetings/screen.dart';
import 'package:video_call_app/pages/meetings/widget/infor_meeting_widget.dart';
import 'package:video_call_app/pages/meetings/widget/participant_people_widget.dart';
import 'package:video_call_app/pages/meetings/widget/leave_meeting_widget.dart';
import 'widget/tool_bar_item_widget.dart';

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
          if (mounted) {
            setState(() {
              _localUserJoined = true;
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
        Positioned(
          left: Dimens.size0,
          right: Dimens.size0,
          bottom: Dimens.size0,
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
                    const ParticipantPeopleWidget(),
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
    );
  }
}
