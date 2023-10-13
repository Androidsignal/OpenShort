import 'package:flutter/material.dart';
import 'package:org/constant/string_constant.dart';
import 'package:org/infrastucture/theme/theme_constant.dart';

class FormCreateScreen extends StatelessWidget {
  const FormCreateScreen({super.key});

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
