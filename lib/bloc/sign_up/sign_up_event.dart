import 'package:equatable/equatable.dart';

class SignUpEvent extends Equatable {
  const SignUpEvent();
  @override
  List<Object?> get props => [];
}

class GetEmailAndPasswordEvent extends SignUpEvent {
  final String? email;
  final String? password;
  const GetEmailAndPasswordEvent({
    this.email,
    this.password,
  });
}

class SignUpWithEmailAndPasswordEvent extends SignUpEvent {}

class SignOutEvent extends SignUpEvent {}
