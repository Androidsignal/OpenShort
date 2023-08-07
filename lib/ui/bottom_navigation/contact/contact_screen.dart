import 'package:flutter/material.dart';
import 'package:org/constant/string_constant.dart';

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
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          children: [
            Container(),
            Container(),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}
