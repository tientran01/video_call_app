import 'package:flutter/material.dart';

class NavigationService {
  static final NavigationService instance = NavigationService._internal();

  NavigationService._internal();

  factory NavigationService() => instance;

  final GlobalKey<NavigatorState> navigationKey =
      GlobalKey<NavigatorState>();

  dynamic goBack() => navigationKey.currentState?.pop();

  Future<dynamic> navigateToScreen(Widget page, {arguments}) async => navigationKey.currentState?.push(
        MaterialPageRoute(
          builder: (_) => page,
        ),
      );
}
