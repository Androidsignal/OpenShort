import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openpgp/openpgp.dart';
import 'package:org/constant/string_constant.dart';
import 'package:org/infrastucture/theme/theme_constant.dart';
import '../../bloc/contact_screen_bloc.dart';
import '../../bloc/contact_screen_event.dart';
import '../../bloc/contact_screen_state.dart';
import '../../../../database_helper/generate_key_services.dart';

class UserKeyGenerateScreen extends StatefulWidget {
  final KeyPair? keyPair;

  const UserKeyGenerateScreen({required this.keyPair, super.key});

  @override
  State<UserKeyGenerateScreen> createState() => _UserKeyGenerateScreenState();
}

class _UserKeyGenerateScreenState extends State<UserKeyGenerateScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController keyResultController = TextEditingController();

  final services = GenerateKeyServices();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsScreenBloc, ContactsScreenState>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  context.read<ContactsScreenBloc>().add(KeyGenerate(isGenerateKey: false));
                },
                child: Icon(
                  Icons.arrow_back_outlined,
                  color: context.designColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            labelText: StringConst.nameHint,
                            hintText: StringConst.nameHint,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Name is required*';
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: StringConst.emailHint,
                          hintText: StringConst.emailHint,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email is required*';
                          }
                          return null;
                        },
                      ),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              const Text(StringConst.keyLength),
              Slider(
                value: state.currentSliderValue,
                max: 8192,
                activeColor: context.designColor,
                inactiveColor: Colors.grey,
                secondaryActiveColor: Colors.red,
                divisions: 3,
                label: state.currentSliderValue.round().toString(),
                onChanged: (double value) {
                  context.read<ContactsScreenBloc>().add(
                        SliderValue(currentSliderValue: value),
                      );
                },
              ),
              Text(
                textAlign: TextAlign.center,
                '${StringConst.keyGenerateTime}-${state.currentSliderValue.round().toString()} ${StringConst.deviceSpecs}',
              ),
              const SizedBox(height: 15),
              state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          if (context.mounted) {
                            context.read<ContactsScreenBloc>().add(IsLoading(isLoading: true));
                          }
                          try {
                            var result = await OpenPGP.encrypt(nameController.text, widget.keyPair?.publicKey ?? '');
                            keyResultController.text = result;
                            services.saveUser(
                              nameController.text,
                              emailController.text,
                              keyResultController.text,
                              DateTime.now().toString(),
                            );
                            if (context.mounted) {
                              context.read<ContactsScreenBloc>().add(
                                    KeyGenerate(isGenerateKey: false),
                                  );
                            }
                            if (context.mounted) {
                              context.read<ContactsScreenBloc>().add(
                                    IsLoading(isLoading: false),
                                  );
                            }
                          } catch (e) {
                            if (context.mounted) {
                              context.read<ContactsScreenBloc>().add(
                                    IsLoading(isLoading: false),
                                  );
                            }
                          }
                        }
                        return;
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.height / 6.2,
                          vertical: 15,
                        ),

                        backgroundColor: context.designColor, // Background color
                      ),
                      child: const Text(
                        StringConst.generateButton,
                        style: TextStyle(fontSize: 14),
                      ),
                    )
            ],
          ),
        );
      },
    );
  }
}
