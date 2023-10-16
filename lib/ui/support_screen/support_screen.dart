import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:org/constant/image_constant.dart';
import 'package:org/constant/string_constant.dart';
import 'package:org/infrastucture/theme/theme_constant.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {

  late StreamSubscription<ConnectivityResult> connectivitySubscription;
  String status = 'Connecting...';

  @override
  void initState() {
    super.initState();

    connectivitySubscription = Connectivity().onConnectivityChanged.listen((result) {
      setState(() {
        if (result == ConnectivityResult.none) {
          status = 'Offline';
        } else {
          status = 'Online';
        }
      });
    });
  }

  @override
  void dispose() {
    connectivitySubscription.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(StringConst.supportScreen),
          actions: const [
            Padding(
              padding: EdgeInsets.only(top: 20, right: 10),
              child: Text('nils'),
            ),
          ],
        ),
        body: Stack(
          children: [
            Image.asset(
              Images.imageChatBackGround,
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              height: 45,
              color: Colors.white,
              width: double.infinity,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   Icon(Icons.circle, size: 15,color: context.designColor,),
                  const SizedBox(width: 10),
                  Text(status,style: TextStyle(color: context.designColor),),
                ],
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                height: 65,
                padding: const EdgeInsets.only(top: 10, bottom: 10, left: 15),
                color: Colors.grey.shade300,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Message",
                          hintStyle: const TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(left: 20),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 45,
                      margin: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: context.designColor,
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: const Icon(Icons.send, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
