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
    apiKey: 'AIzaSyBVECECF_-WumItqniule5GaLo7wv1ji_k',
    appId: '1:490153343889:web:ada56bc9f134bf5595f830',
    messagingSenderId: '490153343889',
    projectId: 'learning-platfom',
    authDomain: 'learning-platfom.firebaseapp.com',
    storageBucket: 'learning-platfom.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCLL1oJOkjIjMAm2PvN0Q-eazdgCH31oCQ',
    appId: '1:490153343889:android:e7ccc2712d307ef295f830',
    messagingSenderId: '490153343889',
    projectId: 'learning-platfom',
    storageBucket: 'learning-platfom.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB4y4pS1YASRjzp4oIctIs73MDhrLf22vA',
    appId: '1:490153343889:ios:9bfe0d33bc674f2d95f830',
    messagingSenderId: '490153343889',
    projectId: 'learning-platfom',
    storageBucket: 'learning-platfom.firebasestorage.app',
    iosBundleId: 'com.example.learningplatform',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB4y4pS1YASRjzp4oIctIs73MDhrLf22vA',
    appId: '1:490153343889:ios:9bfe0d33bc674f2d95f830',
    messagingSenderId: '490153343889',
    projectId: 'learning-platfom',
    storageBucket: 'learning-platfom.firebasestorage.app',
    iosBundleId: 'com.example.learningplatform',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBVECECF_-WumItqniule5GaLo7wv1ji_k',
    appId: '1:490153343889:web:d1dd2f74eee0deb895f830',
    messagingSenderId: '490153343889',
    projectId: 'learning-platfom',
    authDomain: 'learning-platfom.firebaseapp.com',
    storageBucket: 'learning-platfom.firebasestorage.app',
  );

}