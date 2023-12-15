// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
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
    apiKey: 'AIzaSyDVIbaR2ujADuxJ03---b1o0wzg3LG-0RI',
    appId: '1:223544507444:web:7f06eb8bffe0e163345e61',
    messagingSenderId: '223544507444',
    projectId: 'voyage-c95be',
    authDomain: 'voyage-c95be.firebaseapp.com',
    storageBucket: 'voyage-c95be.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBe5Hu6QWf6sMjiEP-Cs4kssqa8dUZQkx0',
    appId: '1:223544507444:android:1d102b02a96af2ad345e61',
    messagingSenderId: '223544507444',
    projectId: 'voyage-c95be',
    storageBucket: 'voyage-c95be.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBzI0hF_w0nlIKlytzo7iHBhs3HNlsRwmM',
    appId: '1:223544507444:ios:afb7b1464eaa4992345e61',
    messagingSenderId: '223544507444',
    projectId: 'voyage-c95be',
    storageBucket: 'voyage-c95be.appspot.com',
    iosBundleId: 'com.example.atelier3',
  );
}
