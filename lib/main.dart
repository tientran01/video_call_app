import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_call_app/bloc/sign_up/sign_up_bloc.dart';
import 'package:video_call_app/pages/home/home_page.dart';
import 'package:video_call_app/route/navigation_service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'bloc/new_meeting/new_meeting_bloc.dart';
import 'configs/locale/generated/l10n.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => SignUpBloc()),
      BlocProvider(create: (_) => NewMeetingBloc()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.instance.navigationKey,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
