import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:org/constant/image_constant.dart';
import 'package:org/constant/string_constant.dart';
import 'package:org/infrastucture/theme/theme_constant.dart';

class BrowserTab extends StatelessWidget {
  const BrowserTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            StringConst.open,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(color: context.designColor),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              border: Border.all(
                color: context.designColor,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  StringConst.appUrlLink,
                ),
                IconButton(
                  onPressed: () {
                    Clipboard.setData(const ClipboardData(text: StringConst.appUrlLink));
                  },
                  icon: Icon(
                    Icons.copy,
                    color: context.designColor,
                  ),
                ),
              ],
            ),
          ),
          Text(
            StringConst.browser,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: context.grey),
          ),
          const SizedBox(
            height: 20,
          ),
          const Icon(
            Icons.tv,
            size: 35,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Lottie.asset(
              Images.arrowDownAnimation,
              height: 100,
              width: 150,
            ),
          ),
          const Icon(
            Icons.phone_android,
            size: 35,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Lottie.asset(Images.arrowDownAnimation, height: 100, width: 150),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 13),
              backgroundColor: context.designColor, // Background color
            ),
            child: const Text(
              StringConst.linkBrowser,
              style: TextStyle(fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
