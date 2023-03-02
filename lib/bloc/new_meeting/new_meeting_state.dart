import 'package:equatable/equatable.dart';
import 'package:video_call_app/components/strings.dart';

class NewMeetingState extends Equatable {
  final String channelName;
  final String channelId;
  const NewMeetingState({
    required this.channelId,
    required this.channelName,
  });
  
  const NewMeetingState.initState()
      : this(
          channelId: Strings.empty,
          channelName: Strings.empty,
        );

  NewMeetingState copyWith({
    String? channelName,
    String? channelId,
  }) {
    return NewMeetingState(
      channelId: channelId ?? this.channelId,
      channelName: channelName ?? this.channelName,
    );
  }

  @override
  List<Object?> get props => [
        channelId,
        channelName,
      ];
}
