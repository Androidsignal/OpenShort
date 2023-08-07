import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:org/constant/string_constant.dart';
import 'package:org/infrastucture/routes/app_navigation.dart';
import 'package:org/infrastucture/routes/name_routes.dart';
import 'package:org/infrastucture/theme/bloc/theme_cubit.dart';
import 'package:org/infrastucture/theme/theme_constant.dart';

class SocketScreen extends StatefulWidget {
  const SocketScreen({super.key});

  @override
  State<SocketScreen> createState() => _SocketScreenState();
}

class _SocketScreenState extends State<SocketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text(
            StringConst.home,
          ),
          leading: Builder(
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.all(13.0),
                child: InkWell(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 1.5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: context.white,
                    ),
                    child: Text(
                      "H",textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: context.designColor,

                          ),
                    ),
                  ),
                ),
              );
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                AppNavigator.toNamed(NameRoutes.addSocketScreen);
              },
              icon: Icon(Icons.south_america, color: context.white, size: 28),
            )
          ],
        ),
        drawer: Drawer(
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              title: const Text(
                StringConst.circle,
              ),
            ),
            body: Column(
              children: [
                ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        contentPadding: const EdgeInsets.only(left: 10),
                        leading: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: context.designColor,
                          ),
                          child: Center(
                            child: Text(
                              "H",
                              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: context.white,
                                  ),
                            ),
                          ),
                        ),
                        title: const Text(
                          StringConst.home,
                        ),
                        minVerticalPadding: 15,
                        subtitle: const FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            StringConst.keys,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.more_vert),
                          onPressed: () {},
                        ),
                      ),
                    );
                  },
                ),
                const Spacer(),
                Container(
                  color: Theme.of(context).colorScheme.secondary,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: TextButton.icon(
                          autofocus: false,
                          onPressed: () {},
                          icon: const Icon(Icons.add_circle_outline),
                          label: Text(
                            StringConst.circleButton,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                      ),
                      BlocBuilder<ThemeCubit, bool>(builder: (context, state) {
                        return SwitchListTile(
                          value: state,
                          onChanged: (value) {
                            BlocProvider.of<ThemeCubit>(context).toggleTheme(value: value);
                          },
                          title:  Text(StringConst.themeMode,style: Theme.of(context).textTheme.titleMedium),
                        );
                      }),
                      Container(
                        padding: const EdgeInsets.only(right: 8),
                        alignment: Alignment.bottomRight,
                        child: const Text(
                          StringConst.version,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.5,
                  width: MediaQuery.of(context).size.height * 0.5,
                  child: Image.asset("assets/image/home_main.png"),
                ),
              ],
            ),
          ],
        ),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.add_event,
          animatedIconTheme: IconThemeData(color: context.white),
          closeDialOnPop: true,
          visible: true,
          children: [
            SpeedDialChild(
                onTap: () {

                },
                labelWidget: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  width: MediaQuery.of(context).size.width * 0.3,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.touch_app_outlined),
                      Text(StringConst.activate),
                    ],
                  ),
                )),
            SpeedDialChild(
                onTap: () {
                  AppNavigator.toNamed(NameRoutes.newSocketFormScreen);
                },
                labelWidget: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  width: 100,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.edit_calendar_outlined),
                      Text(StringConst.news),
                    ],
                  ),
                )),
          ],
        ));
  }
}
