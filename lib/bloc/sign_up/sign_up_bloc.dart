import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_call_app/bloc/sign_up/sign_up_event.dart';
import 'package:video_call_app/bloc/sign_up/sign_up_state.dart';
import 'package:video_call_app/helper/authentication_service.dart';
import 'package:video_call_app/pages/home/screen.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpState.initState()) {
    on<GetEmailAndPasswordEvent>(_onGetEmailAndPassword);
    on<SignUpWithEmailAndPasswordEvent>(_onSignUpWithEmailAndPassword);
    on<SignOutEvent>(_onSignOut);
  }

  void _onGetEmailAndPassword(
    GetEmailAndPasswordEvent event,
    Emitter<void> emitter,
  ) {
    emitter(state.copyWith(
      email: event.email ?? state.email,
      password: event.password ?? state.password,
    ));
  }

  void _onSignUpWithEmailAndPassword(
    SignUpWithEmailAndPasswordEvent event,
    Emitter<void> emitter,
  ) async {
    AuthenticationService.shared.signUpWithEmailAndPassword(
      email: state.email,
      password: state.password,
    );
  }

  void _onSignOut(
    SignOutEvent event,
    Emitter<void> emitter,
  ) {
    AuthenticationService.shared.signOut();
  }

  static SignUpBloc of(BuildContext context) => BlocProvider.of(context);
}
