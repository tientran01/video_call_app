import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object?> get props => [];
}

class SignUpWithEmailAndPasswordEvent extends AuthEvent {
  final String email;
  final String password;
  const SignUpWithEmailAndPasswordEvent({
    required this.email,
    required this.password,
  });
}
