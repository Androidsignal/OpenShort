import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:org/constant/string_constant.dart';
import 'package:org/infrastucture/routes/name_routes.dart';
import 'package:org/infrastucture/theme/theme_constant.dart';

import '../../infrastucture/routes/app_navigation.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConst.settingScreen),
      ),
      body: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.only(left: 25),
            horizontalTitleGap: 0,
            onTap: () => AppNavigator.toNamed(NameRoutes.profileScreen),
            leading: const Icon(Icons.perm_identity),
            title: Text(
              StringConst.profile,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: context.designColor,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          const Divider(thickness: 1),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 25),
            horizontalTitleGap: 0,
            leading: const Icon(Icons.chat),
            title: Text(
              StringConst.chatSetting,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: context.designColor,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          const Divider(thickness: 1),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 25),
            horizontalTitleGap: 0,
            leading: const Icon(Icons.backup),
            title: Text(
              StringConst.backup,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: context.designColor,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          const Divider(thickness: 1),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 25),
            horizontalTitleGap: 0,
            leading: const Icon(Icons.restore),
            title: Text(
              StringConst.restore,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: context.designColor,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          const Divider(thickness: 1),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 25),
            horizontalTitleGap: 0,
            onTap: () {
              showModalBottomSheet<void>(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 2.5,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Container(
                          color: context.designColor,
                          width: 200,
                          height: 2,
                          margin: const EdgeInsets.only(top: 15, bottom: 15),
                        ),
                        const ListTile(
                          leading: Icon(Icons.check_circle_outline),
                          title: Text(StringConst.english),
                        ),
                        Divider(
                          color: context.grey,
                          thickness: 1,
                        ),
                        const ListTile(
                          leading: Icon(Icons.radio_button_unchecked_sharp),
                          title: Text(StringConst.hindi),
                        ),
                        Divider(
                          color: context.grey,
                          thickness: 1,
                        ),
                        const ListTile(
                          leading: Icon(Icons.radio_button_unchecked_sharp),
                          title: Text(StringConst.spanish),
                        ),
                        Divider(
                          color: context.grey,
                          thickness: 1,
                        ),
                        const ListTile(
                          leading: Icon(Icons.radio_button_unchecked_sharp),
                          title: Text(StringConst.gujarati),
                        ),
                        Divider(
                          color: context.grey,
                          thickness: 1,
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            leading: const Icon(Icons.language),
            title: Text(
              StringConst.language,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: context.designColor,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          const Divider(thickness: 1),
        ],
      ),
    );
  }
}
