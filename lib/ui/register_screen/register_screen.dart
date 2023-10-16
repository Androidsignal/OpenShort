import 'package:flutter/material.dart';
import 'package:org/constant/string_constant.dart';
import 'package:org/infrastucture/theme/theme_constant.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final formKey = GlobalKey<FormState>();
    TextEditingController nameController = TextEditingController();
    TextEditingController userNameController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.width / 3,
          horizontal: 30,
        ),
        child: Form(
          key: formKey,
          child: Column(
            children: [
               TextFormField(
                 controller: nameController,
                 keyboardType: TextInputType.name,
                obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return StringConst.nameRequired;
                }
                return null;
              },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: StringConst.nameHint,
                  hintText: StringConst.nameHint,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
               TextFormField(
                controller: userNameController,
                keyboardType: TextInputType.name,
                 validator: (value) {
                   if (value!.isEmpty) {
                     return StringConst.userNameRequired;
                   }
                   return null;
                 },
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: StringConst.userNameHint,
                  hintText: StringConst.userNameHint,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () {
                  if(formKey.currentState!.validate()){

                  } return;
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 12),
                  backgroundColor: context.designColor,
                ),
                child: const Text(
                  StringConst.registerButton,
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
