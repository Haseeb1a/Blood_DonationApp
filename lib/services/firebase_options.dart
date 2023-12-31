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
    apiKey: 'AIzaSyB0l3t0VUmogDCf39dDCrsJ21s7_xYt2OI',
    appId: '1:422246930360:web:be499d6435ef7667b3214d',
    messagingSenderId: '422246930360',
    projectId: 'blood-donation-app-4539a',
    authDomain: 'blood-donation-app-4539a.firebaseapp.com',
    storageBucket: 'blood-donation-app-4539a.appspot.com',
    measurementId: 'G-4P8GBMKGMX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDPfH6ioWU1oSVBQy1XYNO-IhfpDNAot88',
    appId: '1:422246930360:android:45f96a12e83989f9b3214d',
    messagingSenderId: '422246930360',
    projectId: 'blood-donation-app-4539a',
    storageBucket: 'blood-donation-app-4539a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC2dsEjy7zXAjOgOqIY7El94_Iw8hi3F50',
    appId: '1:422246930360:ios:fa31b6162c06f093b3214d',
    messagingSenderId: '422246930360',
    projectId: 'blood-donation-app-4539a',
    storageBucket: 'blood-donation-app-4539a.appspot.com',
    iosBundleId: 'com.example.blooddonation3',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC2dsEjy7zXAjOgOqIY7El94_Iw8hi3F50',
    appId: '1:422246930360:ios:22e38b537c229654b3214d',
    messagingSenderId: '422246930360',
    projectId: 'blood-donation-app-4539a',
    storageBucket: 'blood-donation-app-4539a.appspot.com',
    iosBundleId: 'com.example.blooddonation3.RunnerTests',
  );
}
