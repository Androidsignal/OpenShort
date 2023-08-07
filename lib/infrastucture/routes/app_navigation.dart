import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static toNamed(String routeName, {Object? arguments, Map<String, String>? parameter}) {
    return navigatorKey.currentContext?.pushNamed(routeName, extra: arguments, pathParameters: parameter ?? {});
  }

  static toReplaceNamed(String routeName, {Object? arguments}) {
    return navigatorKey.currentState?.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  static toRemoveAllName(String routeName, {Object? arguments, Map<String, String>? parameter}) {
    return navigatorKey.currentContext?.goNamed(routeName, extra: arguments, pathParameters: parameter ?? {});
  }

  static canPop() {
    return navigatorKey.currentState?.canPop() ?? false;
  }

  static void pop([Object? result]) {
    if (navigatorKey.currentState?.canPop() ?? false) {
      navigatorKey.currentState?.pop(result);
    }
  }

  static void popUntil([String? path]) {
    Future.delayed(Duration.zero, () {
      navigatorKey.currentState?.popUntil((route) {
        if (path != null) {
          return route.settings.name == path;
        }
        return route.isFirst;
      });
    });
  }
}
