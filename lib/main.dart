import 'package:flutter/material.dart';
import 'package:video_call_app/pages/home/home_page.dart';
import 'package:video_call_app/pages/onboard/onboard_page.dart';
import 'package:video_call_app/route/navigation_service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'configs/locale/generated/l10n.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const OnBoardPage(),
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
