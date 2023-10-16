import 'package:flutter/material.dart';
import 'package:org/constant/string_constant.dart';

class FormCreateScreen extends StatelessWidget {
  const FormCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConst.socket),
      ),
    );
  }
}
