import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openpgp/openpgp.dart';
import 'package:org/constant/string_constant.dart';
import 'package:org/infrastucture/theme/theme_constant.dart';
import 'package:org/ui/contact_screen/bloc/contact_screen_event.dart';
import '../../../database_helper/generate_key_services.dart';
import '../../../infrastucture/model/generate_key_model.dart';
import '../bloc/contact_screen_bloc.dart';
import '../bloc/contact_screen_state.dart';

class EncryptionTab extends StatefulWidget {
  final KeyPair? keyPair;

  const EncryptionTab({super.key, this.keyPair});

  @override
  State<EncryptionTab> createState() => _EncryptionTabState();
}

class _EncryptionTabState extends State<EncryptionTab> {
  var selectedName = 'app key';
  var selectedKey = '';

  final TextEditingController _encryptionController = TextEditingController();
  final TextEditingController encryptionResultController = TextEditingController();

  final services = GenerateKeyServices();

  @override
  void dispose() {
    _encryptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsScreenBloc, ContactsScreenState>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 55,
                            width: state.buttonShowEnc ? MediaQuery.of(context).size.width / 1.65 : MediaQuery.of(context).size.width / 1.12,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: context.designColor),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: ListTile(
                              title: const Text(StringConst.encryptionKey),
                              trailing: Icon(
                                state.isEncrDown ? Icons.arrow_drop_down_outlined : Icons.arrow_drop_up,
                                color: context.designColor,
                              ),
                              onTap: () {
                                context.read<ContactsScreenBloc>().add(EncryptionDownUp(isEncrDown: state.isEncrDown));
                              },
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              context.read<ContactsScreenBloc>().add(EncryptionShowKeyList(showKeyList: true));
                              context.read<ContactsScreenBloc>().add(EncryptionSigningDown(isSigningDown: true));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 15, bottom: 25),
                              height: 55,
                              width: state.buttonShowEnc ? MediaQuery.of(context).size.width / 1.65 : MediaQuery.of(context).size.width / 1.12,
                              decoration: BoxDecoration(
                                border: Border.all(width: 1, color: context.designColor),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: ListTile(
                                title: Text(selectedName),
                                trailing: Icon(
                                  state.isSigningDown ? Icons.arrow_drop_down_outlined : Icons.arrow_drop_up,
                                  color: context.designColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (state.buttonShowEnc)
                        InkWell(
                          onTap: () async {
                            try {
                              var result = await OpenPGP.encrypt(_encryptionController.text, widget.keyPair?.publicKey ?? '');
                              encryptionResultController.text = result;
                              _encryptionController.clear();
                            } catch (e) {
                              if (kDebugMode) {
                                print(e);
                              }
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 15, bottom: 25),
                            width: 105,
                            height: 115,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: context.designColor,
                            ),
                            child: Center(
                              child: Text(
                                textAlign: TextAlign.center,
                                StringConst.sing,
                                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                      color: context.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  TextFormField(
                    controller: _encryptionController,
                    minLines: 6,
                    cursorColor: context.designColor,
                    decoration: InputDecoration(
                      fillColor: context.designColor,
                      hintText: StringConst.input,
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
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                  ),
                  const SizedBox(
                    height: 20,
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
                    child: SingleChildScrollView(
                      child: TextFormField(
                        controller: encryptionResultController,
                        enabled: false,
                        minLines: 6,
                        style: TextStyle(color: context.grey),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: StringConst.output,
                          hintStyle: TextStyle(color: context.grey),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            // _onShare(context,encryptionResultController.text);
                            //  await Share.share(encryptionResultController.text, subject: 'Sharing Key');
                          },
                          icon: Icon(Icons.share, color: context.designColor),
                        ),
                        IconButton(
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: encryptionResultController.text));
                          },
                          icon: Icon(Icons.copy, color: context.designColor),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.file_download_outlined, color: context.designColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (state.showKeyList)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8), // Optional: Add rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.width / 3.2),
                  width: state.buttonShowEnc ? MediaQuery.of(context).size.width / 1.65 : MediaQuery.of(context).size.width / 1.12,
                  child: FutureBuilder(
                    future: services.fetchUsers(),
                    builder: (context, snapshot) {
                      List<GenerateKeyModel> keyList = [
                        GenerateKeyModel(name: 'app key', email: '', key: '', dateTime: ''),
                      ];
                      keyList.addAll(snapshot.data ?? []);
                      return ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: keyList.length,
                        itemBuilder: (context, index) {
                          if (!snapshot.hasData) {
                            return const Center(child: CircularProgressIndicator());
                          }
                          return ListTile(
                            onTap: () {
                              selectedName = keyList[index].name.toString();
                              selectedKey = keyList[index].key.toString();

                              context.read<ContactsScreenBloc>().add(
                                    EncryptionButtonShow(buttonShowEnc: true),
                                  );
                              context.read<ContactsScreenBloc>().add(
                                    EncryptionShowKeyList(showKeyList: false),
                                  );
                              context.read<ContactsScreenBloc>().add(
                                    EncryptionSigningDown(isSigningDown: false),
                                  );
                            },
                            title: Text(keyList[index].name),
                          );
                        },
                      );
                    },
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
