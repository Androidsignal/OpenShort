import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:org/infrastucture/theme/theme_constant.dart';
import '../../../../../constant/string_constant.dart';
import '../../../../database_helper/generate_key_services.dart';
import '../../../../infrastucture/model/generate_key_model.dart';
import '../../bloc/contact_screen_bloc.dart';
import '../../bloc/contact_screen_event.dart';

class ShowKeyListScreen extends StatefulWidget {
  const ShowKeyListScreen({super.key});

  @override
  State<ShowKeyListScreen> createState() => _ShowKeyListScreenState();
}

class _ShowKeyListScreenState extends State<ShowKeyListScreen> {
  final services = GenerateKeyServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 2,
              child: ListTile(
                onTap: () {
                  context.read<ContactsScreenBloc>().add(QrCodeCheck(isQrCode: true));
                },
                leading: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.person_outline_rounded,
                      size: 30,
                    ),
                  ),
                ),
                title: Text(
                  StringConst.appKeys,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: context.designColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                subtitle: const Text(
                  StringConst.appUnknownKey,
                ),
                trailing: TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(5)),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: context.designColor),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    StringConst.defaults,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: services.fetchUsers(),
                builder: (context, snapshot) {
                  List<GenerateKeyModel> keyList = snapshot.data ?? [];
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: context.black,
                      ),
                    );
                  } else {
                    return ListView.builder(
                      padding: const EdgeInsets.only(top: 10),
                      primary: false,
                      shrinkWrap: true,
                      itemCount: keyList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 2,
                          child: ListTile(
                            onTap: () {
                              context.read<ContactsScreenBloc>().add(QrCodeCheck(isQrCode: true, keyList: keyList[index]));
                            },
                            title: Row(
                              children: [
                                Text(
                                  keyList[index].name,
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                const Spacer(),
                                Text(keyList[index].dateTime, style: Theme.of(context).textTheme.labelMedium),
                              ],
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Text(keyList[index].email, style: Theme.of(context).textTheme.bodySmall),
                                  const Spacer(),
                                  Text(StringConst.myKey, style: Theme.of(context).textTheme.bodySmall),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: SpeedDial(
        elevation: 0,
        animatedIcon: AnimatedIcons.add_event,
        animatedIconTheme: IconThemeData(color: context.white),
        closeDialOnPop: true,
        overlayColor: Colors.white38,
        visible: true,
        children: [
          SpeedDialChild(
            onTap: () {},
            labelWidget: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.secondary,
              ),
              width: 100,
              height: 50,
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.insert_invitation),
                  Text(StringConst.invite),
                ],
              ),
            ),
          ),
          SpeedDialChild(
            onTap: () {},
            labelWidget: Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.secondary,
              ),
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.import_export),
                  Text(StringConst.import),
                ],
              ),
            ),
          ),
          SpeedDialChild(
            onTap: () => context.read<ContactsScreenBloc>().add(KeyGenerate(isGenerateKey: true)),
            labelWidget: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.secondary,
              ),
              width: 100,
              height: 50,
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.create_new_folder_outlined),
                  Text(StringConst.create),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
