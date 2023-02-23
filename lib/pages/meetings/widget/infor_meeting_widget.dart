import 'package:flutter/services.dart';
import 'package:video_call_app/components/constants.dart';
import 'package:video_call_app/components/device_helper.dart';
import 'package:video_call_app/components/strings.dart';
import 'package:video_call_app/pages/home/screen.dart';
import 'package:video_call_app/pages/widget/text_view.dart';

class InforMeetingWidget extends StatelessWidget {
  const InforMeetingWidget({super.key});

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
          Constants.verticalBox20,
          _inforItem(
            subTitle: '2222 2222',
            title: S.current.meeting_id,
          ),
          _inforItem(
            title: S.current.host,
            subTitle: 'Tran Anh Tien',
          ),
          _inforItem(
            title: S.current.password,
            subTitle: Strings.token,
          ),
          _inforItem(
            title: S.current.invite_link,
            subTitle: Strings.appID,
            isCopy: true,
          ),
          _inforItem(
            title: S.current.participant_id,
            subTitle: Strings.appCertificate,
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
