import 'screen.dart';

class ChannelPage extends StatelessWidget {
  const ChannelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextView(
        text: S.current.no_channel,
        fontColor: AppColors.oldSilver,
        fontSize: Dimens.size17,
      ),
    );
  }
}
