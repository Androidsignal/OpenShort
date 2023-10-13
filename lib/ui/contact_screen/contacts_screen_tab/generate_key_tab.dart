import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openpgp/openpgp.dart';
import 'package:org/ui/contact_screen/contacts_screen_tab/widget/generate_key_qr_code_screen.dart';
import 'package:org/ui/contact_screen/contacts_screen_tab/widget/show_key_list_screen.dart';
import 'package:org/ui/contact_screen/contacts_screen_tab/widget/user_key_generate_screen.dart';
import '../bloc/contact_screen_bloc.dart';
import '../bloc/contact_screen_state.dart';

class GenerateKeyTab extends StatefulWidget {
  const GenerateKeyTab({super.key});

  @override
  State<GenerateKeyTab> createState() => _GeneState();
}

class _GeneState extends State<GenerateKeyTab> {
  KeyPair? keyPair;
  KeyOptions? keyOptions;

  @override
  void initState() {
    getKeyPair();
    super.initState();
  }

  Future<void> getKeyPair() async {
    keyOptions = KeyOptions()..rsaBits = context.read<ContactsScreenBloc>().state.currentSliderValue.toInt();
    keyPair = await OpenPGP.generate(
      options: Options()
        ..name = 'test'
        ..email = 'sentanilesh1234@gmail.com'
        ..passphrase = 'Nils@9401'
        ..keyOptions = keyOptions,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsScreenBloc, ContactsScreenState>(
      builder: (context, state) {
        return state.isQrCode
            ? GenerateKeyQrCodeScreen(keyList: state.keyList)
            : state.isGenerateKey
                ? UserKeyGenerateScreen(keyPair: keyPair)
                : const ShowKeyListScreen();
      },
    );
  }
}
