import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:org/infrastucture/model/generate_key_model.dart';
import 'package:org/infrastucture/theme/theme_constant.dart';
import 'package:org/ui/contact_screen/bloc/contact_screen_bloc.dart';
import 'package:org/ui/contact_screen/bloc/contact_screen_event.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateKeyQrCodeScreen extends StatelessWidget {
  final GenerateKeyModel? keyList;

  const GenerateKeyQrCodeScreen({
    super.key,
    this.keyList,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              context.read<ContactsScreenBloc>().add(QrCodeCheck(isQrCode: false));
            },
            icon: Icon(Icons.arrow_back_outlined, color: context.designColor),
          ),
          Center(
            child: Column(
              children: [
                Text(keyList?.name ?? '', textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  keyList?.email ?? '',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: context.designColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'fnejhfjufhdjbjdsfgdsgrgbdfgfgdfgfdghfdg',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: context.grey),
                ),
                const SizedBox(
                  height: 25,
                ),
                QrImageView(
                  data: keyList?.key ?? '',
                  version: QrVersions.auto,
                  eyeStyle: QrEyeStyle(
                    eyeShape: QrEyeShape.square,
                    color: context.designColor,
                  ),
                  dataModuleStyle: QrDataModuleStyle(
                    dataModuleShape: QrDataModuleShape.square,
                    color: context.designColor,
                  ),
                  size: 200.0,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  keyList?.dateTime ?? '',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(color: context.grey, fontWeight: FontWeight.w600),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  padding: const EdgeInsets.all(8),
                  constraints: const BoxConstraints(maxHeight: 170),
                  decoration: BoxDecoration(
                    border: Border.all(color: context.designColor),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(
                      keyList?.key.toString() ?? '',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(color: context.grey, fontWeight: FontWeight.w600),
                    ),
                  ),
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
                          Clipboard.setData(ClipboardData(text: keyList?.key.toString() ?? ''));
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
          ),
        ],
      ),
    );
  }
}
