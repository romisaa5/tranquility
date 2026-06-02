import 'package:flutter/material.dart';

class AppNavigator {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static NavigatorState get _navigator => navigatorKey.currentState!;

  static Future<T?> push<T>(Widget page) {
    return _navigator.push<T>(MaterialPageRoute(builder: (_) => page));
  }

  static Future<T?> pushReplacement<T, TO>(Widget page) {
    return _navigator.pushReplacement<T, TO>(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  static Future<T?> pushAndRemoveUntil<T>(Widget page) {
    return _navigator.pushAndRemoveUntil<T>(
      MaterialPageRoute(builder: (_) => page),
      (route) => false,
    );
  }

  static void pop<T>([T? result]) {
    _navigator.pop(result);
  }

  static void popUntil(String routeName) {
    _navigator.popUntil(ModalRoute.withName(routeName));
  }

  static Future<bool> maybePop() {
    return _navigator.maybePop();
  }
}
