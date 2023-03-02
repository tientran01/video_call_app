import 'package:equatable/equatable.dart';

abstract class NewMeetingEvent extends Equatable {
  const NewMeetingEvent();
  @override
  List<Object?> get props => [];
}

class GetChannelInforEvent extends NewMeetingEvent {
  final String? channelName;
  final String? channelId;
  const GetChannelInforEvent({
    this.channelName,
    this.channelId,
  });
}
