import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openpgp/openpgp.dart';
import 'package:org/infrastucture/theme/theme_constant.dart';
import 'package:org/ui/contact_screen/bloc/contact_screen_bloc.dart';
import 'package:org/ui/contact_screen/bloc/contact_screen_state.dart';

import '../../../../constant/string_constant.dart';
import '../../../database_helper/generate_key_services.dart';
import '../../../infrastucture/model/generate_key_model.dart';
import '../bloc/contact_screen_event.dart';

class DecryptionTab extends StatefulWidget {
  final KeyPair? keyPair;

  const DecryptionTab({super.key, this.keyPair});

  @override
  State<DecryptionTab> createState() => _DecryptionTabState();
}

class _DecryptionTabState extends State<DecryptionTab> {
  var selectedName = 'app key';
  var selectedKey = '';
  final services = GenerateKeyServices();

  final TextEditingController _decryptionController = TextEditingController();
  TextEditingController decryptionResultController = TextEditingController();

  @override
  void dispose() {
    _decryptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsScreenBloc, ContactsScreenState>(builder: (context, state) {
      return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: InkWell(
          onTap: () {
            context.read<ContactsScreenBloc>().add(DecryptionShowKeyList(showKeyListDecry: false));
            context.read<ContactsScreenBloc>().add(DecryptionSigningDown(isDecrypDown: false));
          },
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              context.read<ContactsScreenBloc>().add(
                                    DecryptionShowKeyList(showKeyListDecry: true),
                                  );
                              context.read<ContactsScreenBloc>().add(
                                    DecryptionSigningDown(isDecrypDown: true),
                                  );
                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 10, bottom: 15),
                              height: 55,
                              width: state.buttonShowDec ? MediaQuery.of(context).size.width / 1.65 : MediaQuery.of(context).size.width / 1.12,
                              decoration: BoxDecoration(
                                border: Border.all(width: 1, color: context.designColor),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: ListTile(
                                title: Text(selectedName),
                                trailing: Icon(
                                  state.isDecrypDown ? Icons.arrow_drop_down_outlined : Icons.arrow_drop_up,
                                  color: context.designColor,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 25),
                            height: 55,
                            width: state.buttonShowDec ? MediaQuery.of(context).size.width / 1.65 : MediaQuery.of(context).size.width / 1.12,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: context.designColor),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: ListTile(
                              title: const Text(StringConst.verifyingKey),
                              trailing: Icon(
                                state.isDecDown ? Icons.arrow_drop_down_outlined : Icons.arrow_drop_up,
                                color: context.designColor,
                              ),
                              onTap: () {
                                context.read<ContactsScreenBloc>().add(
                                      DecryptionDownUp(isDecDown: state.isDecDown),
                                    );
                              },
                            ),
                          ),
                        ],
                      ),
                      if (state.buttonShowDec)
                        InkWell(
                          onTap: () async {
                            try {
                              var result = await OpenPGP.decrypt(
                                _decryptionController.text,
                                widget.keyPair?.privateKey ?? '',
                                "Nilesh@9401",
                              );
                              decryptionResultController.text = result;
                            } catch (e) {
                              if (kDebugMode) {
                                print(e);
                              }
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 15, bottom: 20),
                            width: 98,
                            height: 115,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: context.designColor,
                            ),
                            child: Center(
                              child: Text(
                                textAlign: TextAlign.center,
                                StringConst.decrypt,
                                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                      color: context.white,
                                    ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    constraints: const BoxConstraints(maxHeight: 170),
                    decoration: BoxDecoration(
                      border: Border.all(color: context.designColor),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: TextFormField(
                      controller: _decryptionController,
                      minLines: 6,
                      cursorColor: context.designColor,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: context.designColor,
                        hintText: StringConst.input,
                        labelStyle: const TextStyle(color: Colors.black),
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: decryptionResultController,
                    enabled: false,
                    minLines: 6,
                    style: TextStyle(color: context.grey),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      fillColor: context.designColor,
                      hintText: StringConst.output,
                      hintStyle: TextStyle(color: context.grey),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: context.designColor, width: 2),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      labelStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
              if (state.showKeyListDecry)
                SizedBox(
                  width: state.buttonShowDec ? MediaQuery.of(context).size.width / 1.65 : MediaQuery.of(context).size.width / 1.12,
                  child: Card(
                    elevation: 3,
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.width / 5.5),
                    child: FutureBuilder(
                      future: services.fetchUsers(),
                      builder: (context, snapshot) {
                        List<GenerateKeyModel> keyList = snapshot.data ?? [];
                        return ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: keyList.length,
                          itemBuilder: (context, index) {
                            if (!snapshot.hasData) {
                              return const Center(child: Text('app '));
                            }
                            return ListTile(
                              onTap: () {
                                selectedName = keyList[index].name.toString();
                                selectedKey = keyList[index].key.toString();
                                context.read<ContactsScreenBloc>().add(
                                      DecryptionButtonShow(buttonShowDec: true),
                                    );
                                context.read<ContactsScreenBloc>().add(
                                      DecryptionShowKeyList(showKeyListDecry: false),
                                    );
                                context.read<ContactsScreenBloc>().add(
                                      DecryptionSigningDown(isDecrypDown: false),
                                    );
                              },
                              title: Text(keyList[index].name),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }
}
