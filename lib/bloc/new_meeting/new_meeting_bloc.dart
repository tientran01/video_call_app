import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_call_app/bloc/new_meeting/new_meeting_event.dart';
import 'package:video_call_app/bloc/new_meeting/new_meeting_state.dart';
import 'package:video_call_app/components/strings.dart';
import 'package:video_call_app/pages/home/screen.dart';

class NewMeetingBloc extends Bloc<NewMeetingEvent, NewMeetingState> {
  Random random = Random();
  NewMeetingBloc() : super(const NewMeetingState.initState()) {
    on<GetChannelInforEvent>(_onGetChannelInfor);
  }
  void _onGetChannelInfor(
    GetChannelInforEvent event,
    Emitter<void> emitter,
  ) {
    emitter(state.copyWith(
      channelId: event.channelId ?? state.channelId,
      channelName: (event.channelName?.isEmpty ?? state.channelName.isEmpty)
          ? getRandomChannelName
          : (event.channelName ?? state.channelName),
    ));
  }

  String get getRandomChannelName => String.fromCharCodes(Iterable.generate(
      10,
      (_) => Strings.alphabet.codeUnitAt(random.nextInt(
            Strings.alphabet.length,
          ))));

  static NewMeetingBloc of(BuildContext context) =>
      BlocProvider.of<NewMeetingBloc>(context);
}
