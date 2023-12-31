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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyB1Kw3T1tMbvEzWc8B_f1ddizUQZxBiCnE',
    appId: '1:641768788074:web:0b66dad1842d41b4c1ba13',
    messagingSenderId: '641768788074',
    projectId: 'reactprojet-31be1',
    authDomain: 'reactprojet-31be1.firebaseapp.com',
    storageBucket: 'reactprojet-31be1.appspot.com',
    measurementId: 'G-HPHM68P1QV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCbOs3N886mhVu-Q1UZ7TrmanBWMaiYivE',
    appId: '1:641768788074:android:138c626eb3c2373cc1ba13',
    messagingSenderId: '641768788074',
    projectId: 'reactprojet-31be1',
    storageBucket: 'reactprojet-31be1.appspot.com',
  );
}
