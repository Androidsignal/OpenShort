import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:org/app.dart';
import 'package:org/config/evn.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'config/firebase_options_dev.dart';
import 'constant/gloable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(storageDirectory: await getApplicationDocumentsDirectory());
  await Firebase.initializeApp(name: 'dev', options: DefaultFirebaseOptionsDev.currentPlatform);
   // database = await openDatabase('generateKey.db');
   // Database sqfliteData = await openDatabase('generateKey.db');
  AppEnvironment.setupEnv(Environment.dev);
  runApp(
    MyApp(title: AppEnvironment.appName,),
  );
}

