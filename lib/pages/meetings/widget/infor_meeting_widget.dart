import 'widget.dart';

class InforMeetingWidget extends StatelessWidget {
  final String channelName;
  final String channelId;
  const InforMeetingWidget({
    super.key,
    required this.channelName,
    required this.channelId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Constants.edgeHorizontal30,
      width: DeviceHelper.shared.getWidth(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextView(
            text: S.current.meeting_information,
            fontSize: Dimens.size20,
            fontWeight: FontWeight.w800,
            fontColor: AppColors.blue,
          ),
          _inforItem(
            subTitle: channelName,
            title: S.current.channel_name,
          ),
          _inforItem(
            title: S.current.password,
            subTitle: channelId,
          ),
          _inforItem(
            title: S.current.host,
            subTitle: 'Tran Anh Tien',
          ),
          _inforItem(
            title: S.current.invite_link,
            subTitle: Strings.appID,
            isCopy: true,
          ),
        ],
      ),
    );
  }

  Widget _inforItem({
    required String title,
    required String subTitle,
    bool isCopy = false,
  }) =>
      Padding(
        padding: Constants.edgeVertical10,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: Dimens.size2.toInt(),
              child: TextView(
                text: title,
                fontColor: AppColors.oldSilver,
              ),
            ),
            Expanded(
              flex: Dimens.size3.toInt(),
              child: isCopy
                  ? InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onLongPress: () {
                        Clipboard.setData(
                          ClipboardData(
                            text: subTitle,
                          ),
                        );
                      },
                      child: Tooltip(
                        preferBelow: false,
                        message: S.current.copy,
                        decoration: BoxDecoration(
                          color: AppColors.blue,
                          borderRadius: BorderRadius.circular(
                            Dimens.size10,
                          ),
                        ),
                        child: TextView(
                          text: subTitle,
                          maxLines: Dimens.size3.toInt(),
                        ),
                      ),
                    )
                  : TextView(
                      text: subTitle,
                      maxLines: Dimens.size3.toInt(),
                    ),
            ),
          ],
        ),
      );
}
