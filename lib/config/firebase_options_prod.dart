// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options_prod.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptionsProd {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDkFxO2Z5SphXOjl4m7wwM_o8Y8mu9YNF0',
    appId: '1:396902258002:web:45cc8505137ddef527568b',
    messagingSenderId: '396902258002',
    projectId: 'opensort-prod',
    authDomain: 'opensort-prod.firebaseapp.com',
    storageBucket: 'opensort-prod.appspot.com',
    measurementId: 'G-J9GY7ZJQ70',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDv7pjhJtC7a-5A-Xr1SSSeNm6DCPwGzdI',
    appId: '1:396902258002:android:8c323576b7ec98a327568b',
    messagingSenderId: '396902258002',
    projectId: 'opensort-prod',
    storageBucket: 'opensort-prod.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD-gvoZwtAbBYiYmJsxD5WFUGahcO-HE0c',
    appId: '1:396902258002:ios:e34a7262a98137f627568b',
    messagingSenderId: '396902258002',
    projectId: 'opensort-prod',
    storageBucket: 'opensort-prod.appspot.com',
    iosClientId: '396902258002-dp0gd30fogqs2bsj5vsm48bhu39o298q.apps.googleusercontent.com',
    iosBundleId: 'com.opensort.org',
  );
}
