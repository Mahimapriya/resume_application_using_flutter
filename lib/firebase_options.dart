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
        return macos;
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
    apiKey: 'AIzaSyCq2pXYRXumTBSpCWQFHBLzGNtBXlY0zZc',
    appId: '1:855233575177:web:c3fb36b2633fef4e33bbd8',
    messagingSenderId: '855233575177',
    projectId: 'flutter-cv-app-434c8',
    authDomain: 'flutter-cv-app-434c8.firebaseapp.com',
    storageBucket: 'flutter-cv-app-434c8.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBRSrKT0TSYZoJpUk_oi0AHxBxNWEWr608',
    appId: '1:855233575177:android:ca341b072fba5d3e33bbd8',
    messagingSenderId: '855233575177',
    projectId: 'flutter-cv-app-434c8',
    storageBucket: 'flutter-cv-app-434c8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBEmUP29gkGj4gaGH9TfVL7-5Q4nsNAaYg',
    appId: '1:855233575177:ios:62a7a6a20d84aada33bbd8',
    messagingSenderId: '855233575177',
    projectId: 'flutter-cv-app-434c8',
    storageBucket: 'flutter-cv-app-434c8.appspot.com',
    iosClientId: '855233575177-bqnqsik50u6s3s7i56prv6odlvkoukhb.apps.googleusercontent.com',
    iosBundleId: 'com.example.newapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBEmUP29gkGj4gaGH9TfVL7-5Q4nsNAaYg',
    appId: '1:855233575177:ios:ef935b53ce77a34c33bbd8',
    messagingSenderId: '855233575177',
    projectId: 'flutter-cv-app-434c8',
    storageBucket: 'flutter-cv-app-434c8.appspot.com',
    iosClientId: '855233575177-4dpub3mhalqv3p9g1jl1dhtehblrhg0e.apps.googleusercontent.com',
    iosBundleId: 'com.example.newapp.RunnerTests',
  );
}
