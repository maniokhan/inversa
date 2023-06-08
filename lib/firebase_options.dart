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
    apiKey: 'AIzaSyAhtH9z4B3h3tr2WMegkFkaZixc1LByek0',
    appId: '1:617840654929:web:8e627839ababc002745670',
    messagingSenderId: '617840654929',
    projectId: 'maintenance-e0fdc',
    authDomain: 'maintenance-e0fdc.firebaseapp.com',
    storageBucket: 'maintenance-e0fdc.appspot.com',
    measurementId: 'G-TF7MJ38Y85',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDk8n4xGo_CXVbicK3Khh0IC77ATykUUc4',
    appId: '1:617840654929:android:2dc69550419cb844745670',
    messagingSenderId: '617840654929',
    projectId: 'maintenance-e0fdc',
    storageBucket: 'maintenance-e0fdc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC8vjyTmMvsWD6DKDmHisOCXAdlT8-cw7c',
    appId: '1:617840654929:ios:36f0e75e5ad7a151745670',
    messagingSenderId: '617840654929',
    projectId: 'maintenance-e0fdc',
    storageBucket: 'maintenance-e0fdc.appspot.com',
    androidClientId: '617840654929-5mbk8i8675i74f108tojo36i4vsv2te9.apps.googleusercontent.com',
    iosClientId: '617840654929-vkmflluksbmmg38j75p1ho5k3kel0mne.apps.googleusercontent.com',
    iosBundleId: 'com.example.inversa',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC8vjyTmMvsWD6DKDmHisOCXAdlT8-cw7c',
    appId: '1:617840654929:ios:bc64bf97b50b58e0745670',
    messagingSenderId: '617840654929',
    projectId: 'maintenance-e0fdc',
    storageBucket: 'maintenance-e0fdc.appspot.com',
    androidClientId: '617840654929-5mbk8i8675i74f108tojo36i4vsv2te9.apps.googleusercontent.com',
    iosClientId: '617840654929-lrkhc64m6e6jh5nu2ni78pdquv93lvob.apps.googleusercontent.com',
    iosBundleId: 'com.example.inversa.RunnerTests',
  );
}