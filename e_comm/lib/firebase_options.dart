// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyAjgpUJmzy7YoPsqTV-ZLza60VaMrdoJQY',
    appId: '1:453261302664:web:ffaa108d078a62d9e7783d',
    messagingSenderId: '453261302664',
    projectId: 'sundergarments-a564f',
    authDomain: 'sundergarments-a564f.firebaseapp.com',
    storageBucket: 'sundergarments-a564f.firebasestorage.app',
    measurementId: 'G-DG9Z1Z1H1G',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA3yHgOsoD89un4qoC8jkC0kv7i4VFZ7GM',
    appId: '1:453261302664:android:3a40a0247f11eb1ae7783d',
    messagingSenderId: '453261302664',
    projectId: 'sundergarments-a564f',
    storageBucket: 'sundergarments-a564f.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBp-Y-Kx1rQrUXhy89wdCIN9_8fceqJ6EE',
    appId: '1:453261302664:ios:c23aca15af33aa54e7783d',
    messagingSenderId: '453261302664',
    projectId: 'sundergarments-a564f',
    storageBucket: 'sundergarments-a564f.firebasestorage.app',
    iosBundleId: 'com.example.eComm',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBp-Y-Kx1rQrUXhy89wdCIN9_8fceqJ6EE',
    appId: '1:453261302664:ios:c23aca15af33aa54e7783d',
    messagingSenderId: '453261302664',
    projectId: 'sundergarments-a564f',
    storageBucket: 'sundergarments-a564f.firebasestorage.app',
    iosBundleId: 'com.example.eComm',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAjgpUJmzy7YoPsqTV-ZLza60VaMrdoJQY',
    appId: '1:453261302664:web:1556417e5c310c3ee7783d',
    messagingSenderId: '453261302664',
    projectId: 'sundergarments-a564f',
    authDomain: 'sundergarments-a564f.firebaseapp.com',
    storageBucket: 'sundergarments-a564f.firebasestorage.app',
    measurementId: 'G-TT19PLST54',
  );
}
