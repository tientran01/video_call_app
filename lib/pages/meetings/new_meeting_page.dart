
import 'screen.dart';

class NewMeetingPage extends BaseScreen {
  const NewMeetingPage({Key? key}) : super(key: key);

  @override
  NewMeetingPageState createState() => NewMeetingPageState();
}

class NewMeetingPageState extends BaseScreenState<NewMeetingPage> {
  final _formKey = GlobalKey<FormState>();
  final _channelController = TextEditingController();
  String _channelId = '';

  @override
  String title() => S.current.start_meeting;

  @override
  LeadingButtonType leadingButtonType() => LeadingButtonType.backText;

  @override
  void dispose() {
    _channelController.dispose();
    _channelController.text.isEmpty;
    super.dispose();
  }

  bool get channelIdEmpty => (_channelController.text.isNotEmpty);

  bool get isDisableButton => (_channelController.text.isNotEmpty &&
      _channelController.text.length >= Dimens.size8.toInt());

  @override
  Widget body() {
    return SafeArea(
      child: Padding(
        padding: Constants.edgeInsetsAll15,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: _formKey,
              child: CustomTextFormField(
                textEditingController: _channelController,
                fillColor: Colors.grey.shade300,
                hintText: S.current.meeting_id,
                typeInputTextField: TypeInputTextField.channelId,
                autoFocus: true,
                prefixWidgetType: PrefixWidgetTextField.prefixIcon,
                iconPrefixPath: Assets.icons.icLink.path,
                suffixWidgetType: SuffixWidgetTextField.suffixIconClear,
                onChanged: (value) {
                  setState(() {
                    _channelId = value;
                    _channelId = _channelController.text;
                  });
                },
                suffixIcon: channelIdEmpty
                    ? IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        onPressed: () {
                          _channelController.clear();
                          setState(() {
                            _channelId = Strings.empty;
                          });
                        },
                        icon: Assets.icons.icCancel.image(
                          color: AppColors.oldSilver.withOpacity(
                            Dimens.opacity4,
                          ),
                          width: Dimens.size20,
                        ),
                      )
                    : Constants.emptyBox,
                formatter: [
                  LengthLimitingTextInputFormatter(
                    8,
                  ),
                ],
              ),
            ),
            Constants.verticalBox10,
            TextView(
              text: S.current.channel_id_invalid,
              fontColor: AppColors.oldSilver,
            ),
            Constants.verticalBox20,
            CustomButton(
              title: S.current.start_meeting,
              bgColor: AppColors.blue,
              width: MediaQuery.of(context).size.width,
              onTap: () => onJoin(),
              disableButton: !isDisableButton,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onJoin() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_channelId == Strings.channelName) {
      NavigationService.instance.navigateToScreen(
        CallVideoPage(
          channelID: _channelId,
        ),
      );
      setState(() {
        _channelController.clear();
        _channelId = Strings.empty;
      });
    } else {
      NavigationService.instance.showPopUp(
        barrierDismissible: false,
        context: context,
        title: "Invalid Meeting ID",
        content: "This is my content",
        defaultActionText: S.current.continue_,
      );
    }
  }
}
