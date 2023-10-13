import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:org/infrastucture/routes/app_navigation.dart';
import 'package:org/ui/home_screen/home_screen.dart';
import 'package:org/ui/register_screen/register_screen.dart';
import 'package:org/ui/socket_screen/add_socket_screen.dart';
import 'package:org/ui/socket_screen/form_create_screen.dart';


class NameRoutes {
  static final NameRoutes _singleton = NameRoutes._internal();


  NameRoutes._internal();

  factory NameRoutes() {
    return _singleton;

  }
  //  static Database? database;
  //
  // checkUserRegister() async {
  //   database = await openDatabase('generateKey.db');
  // }


  static ValueNotifier<dynamic> changeListener = ValueNotifier(null);

  static const homeScreen = "/";
  static const registerScreen = "/registerScreen";
  static const secondScreen = "/secondScreen";
  static const addSocketScreen = "/addSocketScreen";
  static const newSocketFormScreen = "/newSocketFormScreen";


  static final GoRouter router = GoRouter(
    // initialLocation: DbHelper.database().isUndefinedOrNull ? registerScreen : homeScreen ,
    // initialLocation: database != null ? homeScreen : registerScreen,
    initialLocation:  homeScreen ,
    refreshListenable: changeListener,
    // redirect: (context, state) async {
    //
    //   if (DbHelper.database().isUndefinedOrNull) {
    //     return registerScreen.parsePath;
    //   }
    //     return homeScreen.parsePath;
    //
    //
    // },
    navigatorKey: AppNavigator.navigatorKey,
    routes: [
      GoRoute(
        path: homeScreen.parsePath,
        name: homeScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: registerScreen.parsePath,
        name: registerScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const RegisterScreen();
        },
      ),

      GoRoute(
        path: addSocketScreen.parsePath,
        name: addSocketScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const AddSocketScreen();
        },
      ),
      GoRoute(
        path: newSocketFormScreen.parsePath,
        name: newSocketFormScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const FormCreateScreen();
        },
      ),
    ],
  );
}

extension PathRoute on String {
  String get parsePath {
    switch (this) {
      case NameRoutes.homeScreen:
        return '/';
      case NameRoutes.registerScreen:
        return '/registerScreen';
      case NameRoutes.secondScreen:
        return '/secondScreen';
      case NameRoutes.addSocketScreen:
        return '/addSocketScreen';
      case NameRoutes.newSocketFormScreen:
        return '/newSocketFormScreen';
      default:
        return '/unknown';
    }
  }
}
