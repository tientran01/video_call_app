import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_call_app/bloc/authentication/auth_event.dart';
import 'package:video_call_app/bloc/authentication/auth_state.dart';
import 'package:video_call_app/pages/home/screen.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState.initState());

  static AuthBloc of(BuildContext context) =>
      BlocProvider.of<AuthBloc>(context);
}
