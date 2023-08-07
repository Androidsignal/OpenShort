import 'package:flutter/material.dart';
import 'package:org/constant/string_constant.dart';
import 'package:org/infrastucture/theme/theme_constant.dart';

class NewSocketFormScreen extends StatefulWidget {
  const NewSocketFormScreen({super.key});

  @override
  State<NewSocketFormScreen> createState() => _NewSocketFormScreenState();
}

class _NewSocketFormScreenState extends State<NewSocketFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(StringConst.socket),
      ),
      body: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: context.designColor),
        ),
        child: SizedBox(
          child: Column(
            children: [
              TextFormField()
            ],
          ),
        ),
      ),
    );
  }
}
