import 'package:flutter/material.dart';

enum Environment { dev, prod }

abstract class AppEnvironment {
  static String? headerKey;
  static String? baseApiUrl;
  static late String appName;
  static late Environment _environment;
  static late MaterialColor primarySwatch;

  static Environment get environment => _environment;

  static setupEnv(Environment env) {
    _environment = env;
    switch (env) {
      case Environment.dev:
        {
          headerKey = 'Authorization';
          appName = 'Opensort Dev';
          primarySwatch = Colors.yellow;
          baseApiUrl = 'https://api-todo-flutter.herokuapp.com/';
          break;
        }
      case Environment.prod:
        {
          appName = 'Opensort';
          primarySwatch = Colors.green;
          headerKey = 'Authorization';
          baseApiUrl = 'https://api-todo-flutter.herokuapp.com/';

          break;
        }
    }
  }
}