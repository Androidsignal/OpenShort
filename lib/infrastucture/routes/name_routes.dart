

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:org/infrastucture/routes/app_navigation.dart';
import 'package:org/ui/Home_Screen/home_screen.dart';
import 'package:org/ui/bottom_navigation/socket/add_socket/add_socket_screen.dart';
import 'package:org/ui/bottom_navigation/socket/socket_form/new_socket_form_fill.dart';
import 'package:org/ui/second_screen.dart';


 class NameRoutes {

  static final NameRoutes _singleton = NameRoutes._internal();

  NameRoutes._internal();

  factory NameRoutes() {
   return _singleton;
  }

  static ValueNotifier<dynamic> changeListener = ValueNotifier(null);

  static const homeScreen = "/";
  static const secondScreen = "/secondScreen";
  static const addSocketScreen = "/addSocketScreen";
  static const newSocketFormScreen = "/newSocketFormScreen";


  static final  GoRouter router = GoRouter(
   initialLocation: homeScreen,
   refreshListenable: changeListener,
   navigatorKey: AppNavigator.navigatorKey,

   routes: [
    GoRoute(
     path: homeScreen.parsePath,
     name: homeScreen,
     builder: (BuildContext context,GoRouterState state) {
      return  const HomeScreen();
     },
    ),

    GoRoute(
     path: secondScreen.parsePath,
     name: secondScreen,
     builder: (BuildContext context, GoRouterState state) {
      return  const SecondScreen();
     },
    ),
    GoRoute(
     path: addSocketScreen.parsePath,
     name: addSocketScreen,
     builder: (BuildContext context, GoRouterState state) {
      return  const AddSocketScreen();
     },
    ),
    GoRoute(
     path: newSocketFormScreen.parsePath,
     name: newSocketFormScreen,
     builder: (BuildContext context, GoRouterState state) {
      return  const NewSocketFormScreen();
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