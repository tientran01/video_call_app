import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final String? email;
  final String? password;

  const AuthState({
    this.email,
    this.password,
  });

  const AuthState.initState() : this();

  AuthState copyWith({
    String? email,
    String? password,
  }) {
    return AuthState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
  @override
  List<Object?> get props => [email, password,];
}
