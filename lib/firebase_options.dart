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
    apiKey: 'AIzaSyDcg05EpzN-cDRIljOlZPdhzJmjTzu7BGU',
    appId: '1:381911750010:web:548fc62c87263d518672c3',
    messagingSenderId: '381911750010',
    projectId: 'deliverzler-ecab4',
    authDomain: 'deliverzler-ecab4.firebaseapp.com',
    storageBucket: 'deliverzler-ecab4.appspot.com',
    measurementId: 'G-T8EPD2YN26',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCJ3Dbd_AIXDtr1aasU7xZG3G4STZF-pio',
    appId: '1:381911750010:android:bd5e8a88baa8047c8672c3',
    messagingSenderId: '381911750010',
    projectId: 'deliverzler-ecab4',
    storageBucket: 'deliverzler-ecab4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC0fUlML2GBFXhHPYna3WVcddDM7v-M5YU',
    appId: '1:381911750010:ios:da3485eea33022d28672c3',
    messagingSenderId: '381911750010',
    projectId: 'deliverzler-ecab4',
    storageBucket: 'deliverzler-ecab4.appspot.com',
    iosClientId:
        '381911750010-destcvcni2mkjmhmiokb39lspq3d4snq.apps.googleusercontent.com',
    iosBundleId: 'com.abubakar.inversaapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC0fUlML2GBFXhHPYna3WVcddDM7v-M5YU',
    appId: '1:381911750010:ios:3f39170ecfa3f3ce8672c3',
    messagingSenderId: '381911750010',
    projectId: 'deliverzler-ecab4',
    storageBucket: 'deliverzler-ecab4.appspot.com',
    iosClientId:
        '381911750010-bj1jfvusuls7jgb0722t5p6h027uhac8.apps.googleusercontent.com',
    iosBundleId: 'com.abubakar.inversaapp.RunnerTests',
  );
}
