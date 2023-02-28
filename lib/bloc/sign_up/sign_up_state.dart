import 'package:equatable/equatable.dart';
import 'package:video_call_app/components/strings.dart';

class SignUpState extends Equatable {
  final String email;
  final String password;
  const SignUpState({
    required this.email,
    required this.password,
  });

  const SignUpState.initState()
      : this(
          email: Strings.empty,
          password: Strings.empty,
        );

  SignUpState copyWith({
    String? email,
    String? password,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}
