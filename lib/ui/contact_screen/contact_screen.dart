import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openpgp/openpgp.dart';
import 'package:org/constant/string_constant.dart';
import 'package:org/ui/contact_screen/bloc/contact_screen_state.dart';
import 'bloc/contact_screen_bloc.dart';
import 'bloc/contact_screen_event.dart';
import 'contacts_screen_tab/browser_tab.dart';
import 'contacts_screen_tab/decryption_tab.dart';
import 'contacts_screen_tab/encryption_tab.dart';
import 'contacts_screen_tab/generate_key_tab.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> with TickerProviderStateMixin {
  late final TabController tabController;



  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);

    // context.read<ContactsScreenBloc>().add(GenerateKeyPair());
    getKeyPair();
  }

  Future<void> getKeyPair() async {
    context.read<ContactsScreenBloc>().add(GenerateKeyPair());
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsScreenBloc,ContactsScreenState>(
      builder: (context,state) {
        return DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: false,
              title: const Text(StringConst.openPgp),
              bottom: TabBar(
                controller: tabController,
                tabs: const [
                  Tab(
                    icon: Icon(Icons.person_outline_rounded),
                  ),
                  Tab(
                    icon: Icon(Icons.lock_outline_rounded),
                  ),
                  Tab(
                    icon: Icon(Icons.lock_open_rounded),
                  ),
                  Tab(
                    icon: Icon(Icons.groups_rounded),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              controller: tabController,
              children: [
                const GenerateKeyTab(),
                EncryptionTab(keyPair: state.keyPair),
                DecryptionTab(keyPair: state.keyPair),
                const BrowserTab(),
              ],
            ),
          ),
        );
      }
    );
  }
}
