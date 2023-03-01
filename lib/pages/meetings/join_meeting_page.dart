import 'package:video_call_app/pages/meetings/widget/participant_people_widget.dart';

import 'screen.dart';

class JoinMeetingPage extends BaseScreen {
  final String channelName;
  final String channelId;
  const JoinMeetingPage({
    Key? key,
    required this.channelName,
    required this.channelId,
  }) : super(key: key);

  @override
  JoinMeetingPageState createState() => JoinMeetingPageState();
}

class JoinMeetingPageState extends BaseScreenState<JoinMeetingPage>
    with TickerProviderStateMixin {
  bool muted = false;

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
  Widget appBarWidget() => InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          NavigationService.instance.showBottomSheet(
            child: InforMeetingWidget(
              channelId: widget.channelId,
              channelName: widget.channelName,
            ),
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

  @override
  Widget body() {
    return Stack(
      children: [
        Positioned(
          left: Dimens.size0,
          right: Dimens.size0,
          bottom: Dimens.size0,
          child: ToolBarWidget(
            muted: muted,
            onTapUnmute: () {
              if (mounted) {
                setState(() {
                  muted = !muted;
                });
              }
            },
            onTapParticipants: () =>
                NavigationService.instance.navigateToScreen(
              const ParticipantPeopleWidget(
                numberOfPeopleInThisChannel: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
