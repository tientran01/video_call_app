// ignore_for_file: avoid_print

import 'dart:math';

import 'package:agora_rtm/agora_rtm.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_call_app/bloc/new_meeting/new_meeting_bloc.dart';
import 'package:video_call_app/bloc/new_meeting/new_meeting_event.dart';
import 'package:video_call_app/bloc/new_meeting/new_meeting_state.dart';
import 'package:video_call_app/pages/meetings/join_meeting_page.dart';
import 'package:video_call_app/pages/meetings/widget/widget.dart';

class CreateNewChannelPage extends BaseScreen {
  const CreateNewChannelPage({Key? key}) : super(key: key);

  @override
  CreateNewChannelPageState createState() => CreateNewChannelPageState();
}

class CreateNewChannelPageState extends BaseScreenState<CreateNewChannelPage> {
  final TextEditingController _channelIdController = TextEditingController();
  final TextEditingController _channelNameController = TextEditingController();
  Random random = Random();
  String _channelName = Strings.empty;
  String _channelId = Strings.empty;
  final _formKey = GlobalKey<FormState>();
  late NewMeetingBloc newMeetingBloc;
  final username = "Tran Thi Anh Tien";
  bool _isChannelCreated = true;
  final Map<String, List<String>> _seniorMember = {};
  final Map<String, int> _channelList = {};
  late AgoraRtmClient? _client;
  late AgoraRtmChannel? _channel;
  late AgoraRtmChannel? _subchannel;
  String myChannel = Strings.empty;

  @override
  void initState() {
    super.initState();
    newMeetingBloc = NewMeetingBloc.of(context);
  }

  @override
  String title() => S.current.create_new_channel;

  @override
  LeadingButtonType leadingButtonType() => LeadingButtonType.backText;

  bool get disableButton => _channelIdController.text.length == 8;

  Future<void> _onCreateChannels({required String channelId}) async {
    setState(() {
      _channelList.putIfAbsent(channelId, () => 1);
      _seniorMember.putIfAbsent(channelId, () => [username]);
      myChannel = channelId;
    });
    await _channel?.sendMessage(AgoraRtmMessage.fromText('$channelId: 1'));
    _channelIdController.clear();
    _subchannel = await _client?.createChannel(channelId);
    await _subchannel?.join();
    print('List of channels : $_channelList');
  }

  @override
  Widget body() {
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      padding: Constants.edgeVertical20,
      physics: const BouncingScrollPhysics(),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: height,
        ),
        padding: Constants.edgeInsetsAll15,
        child: Column(
          children: [
            _createNewChannel(),
            Constants.verticalBox50,
            _joinChannelExisting(isChannelCreated: _isChannelCreated),
          ],
        ),
      ),
    );
  }

  Widget _joinChannelExisting({bool isChannelCreated = true}) {
    return Column(
      children: [
        isChannelCreated
            ? TextView(
                text:
                    'Join an existing channel or create your own. Call will start when there are at least 2 users in your channel',
                maxLines: Dimens.size5.toInt(),
                fontColor: AppColors.blue,
                fontWeight: FontWeight.w700,
              )
            : Constants.emptyBox,
        Constants.verticalBox10,
        isChannelCreated
            ? ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => _joinChannelItem(
                  name: S.current.channel_name,
                  totalOfPeopleInThisChannel: 5,
                  numberOfPeopleInThisChannel: 1,
                  id: Strings.channelName,
                ),
                itemCount: 2,
              )
            : const TextView(text: "Please create a channel first"),
      ],
    );
  }

  Widget _joinChannelItem({
    required String name,
    required int totalOfPeopleInThisChannel,
    required int numberOfPeopleInThisChannel,
    required String id,
  }) {
    return NoSplashWidget(
      child: InkWell(
        onTap: () => NavigationService.instance.navigateToScreen(
          JoinMeetingPage(
            channelName: name,
            channelId: id,
          ),
        ),
        child: Container(
          padding: Constants.edgeInsetsAll15,
          margin: Constants.edgeVertical5,
          decoration: BoxDecoration(
            color: AppColors.blue.withOpacity(Dimens.opacity4),
            borderRadius: BorderRadius.circular(
              Dimens.size15,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: TextView(
                  text: name,
                  maxLines: Dimens.size5.toInt(),
                ),
              ),
              Expanded(
                child: NoSplashWidget(
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Assets.icons.icParticipants.image(
                          width: Dimens.size20,
                        ),
                        Constants.horizontalBox5,
                        TextView(
                          text: numberOfPeopleInThisChannel.toString() +
                              Strings.splash +
                              totalOfPeopleInThisChannel.toString(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: NoSplashWidget(
                  child: IconButton(
                    alignment: Alignment.centerRight,
                    onPressed: () =>
                        NavigationService.instance.navigateToScreen(
                      JoinMeetingPage(
                        channelName: name,
                        channelId: id,
                      ),
                    ),
                    icon: Assets.icons.icArrowRight.image(
                      width: Dimens.size20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createNewChannel() {
    return BlocBuilder<NewMeetingBloc, NewMeetingState>(
      bloc: newMeetingBloc,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              text: S.current.create_new_channel,
              upperCaseText: true,
            ),
            Constants.verticalBox10,
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    typeInputTextField: TypeInputTextField.normal,
                    textEditingController: _channelNameController,
                    prefixWidgetType: PrefixWidgetTextField.prefixText,
                    textPrefix: S.current.channel_name,
                    hintText: S.current.channel_name.toLowerCase(),
                    suffixWidgetType: SuffixWidgetTextField.suffixIconClear,
                    onChanged: (value) {
                      setState(() {
                        value = _channelNameController.text;
                      });
                      newMeetingBloc.add(GetChannelInforEvent(
                        channelName: _channelNameController.text,
                      ));
                    },
                    suffixIcon: (_channelName.isNotEmpty ||
                            _channelNameController.text.isNotEmpty)
                        ? IconButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            onPressed: () {
                              _channelNameController.clear();
                              setState(() {
                                _channelName = Strings.empty;
                              });
                              newMeetingBloc.add(GetChannelInforEvent(
                                channelName: _channelNameController.text,
                              ));
                            },
                            icon: Assets.icons.icCancel.image(
                              color: AppColors.oldSilver.withOpacity(
                                Dimens.opacity4,
                              ),
                              width: Dimens.size20,
                            ),
                          )
                        : Constants.emptyBox,
                  ),
                  Constants.verticalBox10,
                  CustomTextFormField(
                    typeInputTextField: TypeInputTextField.normal,
                    textEditingController: _channelIdController,
                    prefixWidgetType: PrefixWidgetTextField.prefixText,
                    textPrefix: S.current.meeting_id,
                    hintText: S.current.meeting_id.toLowerCase(),
                    suffixWidgetType: SuffixWidgetTextField.suffixIconClear,
                    onChanged: (value) {
                      setState(() {
                        _channelId = value;
                        _channelId = _channelIdController.text;
                      });
                      newMeetingBloc.add(GetChannelInforEvent(
                        channelId: _channelId,
                      ));
                    },
                    formatter: [
                      LengthLimitingTextInputFormatter(
                        Dimens.size8.toInt(),
                      ),
                    ],
                    suffixIcon: (_channelId.isNotEmpty ||
                            _channelIdController.text.isNotEmpty)
                        ? IconButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            onPressed: () {
                              _channelIdController.clear();
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
                  ),
                ],
              ),
            ),
            Constants.verticalBox10,
            TextView(
              text: S.current.channel_id_invalid,
              fontSize: Dimens.size12,
              fontColor: AppColors.blue,
              fontWeight: FontWeight.w700,
            ),
            Constants.verticalBox20,
            CustomButton(
              title: S.current.create.toUpperCase(),
              disableButton: !disableButton,
              onTap: () => NavigationService.instance.showPopUp(
                title: S.current.create_new_channel +
                    Strings.space +
                    S.current.with_,
                context: context,
                subTitle: S.current.channel_name +
                    Strings.colon +
                    Strings.space +
                    state.channelName,
                content: S.current.meeting_id +
                    Strings.colon +
                    Strings.space +
                    state.channelId,
                defaultActionText: S.current.continue_,
                cancelOnTap: () {
                  NavigationService.instance.goBack();
                  _onCreateChannels(
                    channelId: _channelIdController.text,
                  );
                  _channelIdController.clear();
                  _channelNameController.clear();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
