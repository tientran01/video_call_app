import 'package:video_call_app/pages/contacts/screen.dart';

class ParticipantPeopleWidget extends BaseScreen {
  final int numberOfPeopleInThisChannel;
  const ParticipantPeopleWidget({
    super.key,
    this.numberOfPeopleInThisChannel = 0,
  });

  @override
  ParticipantPeopleWidgetState createState() => ParticipantPeopleWidgetState();
}

class ParticipantPeopleWidgetState
    extends BaseScreenState<ParticipantPeopleWidget> {
  bool muted = false;
  bool turnOffCamera = false;
  @override
  LeadingButtonType leadingButtonType() => LeadingButtonType.backText;

  @override
  String title() => S.current.participant;

  @override
  Widget body() => ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildItem(),
              Constants.dividerCustom(
                color: AppColors.brightGray,
              ),
            ],
          );
        },
        itemCount: widget.numberOfPeopleInThisChannel,
      );

  Widget _buildItem() {
    return Container(
      padding: Constants.edgeHori15Verti10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                Dimens.size10,
              ),
              child: Assets.images.imUser.image(),
            ),
          ),
          Expanded(
            flex: Dimens.size3.toInt(),
            child: TextView(
              textAlign: TextAlign.center,
              text: S.current.add_your_phone_number,
              maxLines: Dimens.size4.toInt(),
            ),
          ),
          // Expanded(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       InkWell(
          //         splashColor: Colors.transparent,
          //         highlightColor: Colors.transparent,
          //         onTap: () {
          //           setState(() {
          //             muted = !muted;
          //           });
          //         },
          //         child: Padding(
          //           padding: Constants.edgeInsetsAll5,
          //           child: muted
          //               ? Assets.icons.icMicOff.image(
          //                   width: Dimens.size20,
          //                   color: Colors.red,
          //                 )
          //               : Assets.icons.icMic.image(
          //                   width: Dimens.size20,
          //                 ),
          //         ),
          //       ),
          //       InkWell(
          //         splashColor: Colors.transparent,
          //         highlightColor: Colors.transparent,
          //         onTap: () {
          //           setState(() {
          //             turnOffCamera = !turnOffCamera;
          //           });
          //         },
          //         child: Padding(
          //           padding: Constants.edgeInsetsAll5,
          //           child: turnOffCamera
          //               ? Assets.icons.icVideoOff.image(
          //                   width: Dimens.size23,
          //                   color: Colors.red,
          //                 )
          //               : Assets.icons.icMeeting.image(
          //                   width: Dimens.size23,
          //                 ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
