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
    apiKey: 'AIzaSyARqBG5bVwE7WPr2cEZGVTgZ27t9yvbPCA',
    appId: '1:751064713092:web:b5d6f9b9c564a436013fd1',
    messagingSenderId: '751064713092',
    projectId: 'flutter3abc',
    authDomain: 'flutter3abc.firebaseapp.com',
    storageBucket: 'flutter3abc.firebasestorage.app',
    measurementId: 'G-6LE09RDD9V',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBSz7vfkJaUfDQ1t5c4fnuf2eWgB2z196g',
    appId: '1:751064713092:android:44839fcf53d945d4013fd1',
    messagingSenderId: '751064713092',
    projectId: 'flutter3abc',
    storageBucket: 'flutter3abc.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCqJHx3Ck62NU6RVdbUOKtz25n4YfHntfA',
    appId: '1:751064713092:ios:e2fdefb58c5e9d62013fd1',
    messagingSenderId: '751064713092',
    projectId: 'flutter3abc',
    storageBucket: 'flutter3abc.firebasestorage.app',
    iosBundleId: 'com.angcyo.flutter3.abc',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCqJHx3Ck62NU6RVdbUOKtz25n4YfHntfA',
    appId: '1:751064713092:ios:b4d6672fa02a02c0013fd1',
    messagingSenderId: '751064713092',
    projectId: 'flutter3abc',
    storageBucket: 'flutter3abc.firebasestorage.app',
    iosBundleId: 'com.angcyo.flutter3Abc',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyARqBG5bVwE7WPr2cEZGVTgZ27t9yvbPCA',
    appId: '1:751064713092:web:32e53771cd1e9df9013fd1',
    messagingSenderId: '751064713092',
    projectId: 'flutter3abc',
    authDomain: 'flutter3abc.firebaseapp.com',
    storageBucket: 'flutter3abc.firebasestorage.app',
    measurementId: 'G-SKX2E6TYTZ',
  );
}
