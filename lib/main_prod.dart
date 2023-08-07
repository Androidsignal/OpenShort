

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:org/app.dart';
import 'package:org/config/evn.dart';
import 'package:org/config/firebase_options_prod.dart';
import 'package:path_provider/path_provider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(storageDirectory: await getApplicationDocumentsDirectory());
  await Firebase.initializeApp(name: 'prod', options: DefaultFirebaseOptionsProd.currentPlatform);
  AppEnvironment.setupEnv(Environment.prod);
  runApp(MyApp(title: AppEnvironment.appName));
}