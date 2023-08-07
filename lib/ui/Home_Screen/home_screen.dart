import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:org/constant/string_constant.dart';
import 'package:org/infrastucture/theme/theme_constant.dart';
import 'package:org/ui/Home_Screen/bloc/home_event.dart';
import 'package:org/ui/Home_Screen/bloc/home_state.dart';
import 'package:org/ui/bottom_navigation/contact/contact_screen.dart';
import 'package:org/ui/bottom_navigation/settings/setting_screen.dart';
import 'package:org/ui/bottom_navigation/socket/socket_screen.dart';
import 'package:org/ui/bottom_navigation/support/support_screen.dart';

import 'bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  static const List<Widget> _widgetOptions = <Widget>[
    SocketScreen(),
    ContactScreen(),
    SupportScreen(),
    SettingScreen()
  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<HomeBloc , HomeState>(
        builder: (context , state) {
          return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: StringConst.socket,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: StringConst.contact,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support_agent_sharp),
            label: StringConst.support,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: StringConst.setting,
          ),
        ],
        currentIndex: state.selectedIndex ?? 0,
        selectedItemColor: context.designColor,
        onTap: (int index){
          context.read<HomeBloc>().add(
              PageChangeEvent(selectedIndex: index)
          );
        },
        selectedLabelStyle: const TextStyle(color: Colors.cyan),
        unselectedItemColor: context.grey,
      );
        },

      ),
      body: BlocBuilder<HomeBloc , HomeState>(
        builder: (context , state) {
          return Center(
            child: _widgetOptions.elementAt(state.selectedIndex ?? 0),
          );
        }
      ),
    );
  }
}
