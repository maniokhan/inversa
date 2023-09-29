import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:inversaapp/firebase_options.dart';
import 'package:inversaapp/src/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? appPrefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.remove();
  await Firebase.initializeApp(
    name: 'inversappmx',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  appPrefs = await SharedPreferences.getInstance();
  final LocationPermission permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied ||
      permission == LocationPermission.deniedForever) {
    // ref.read(locationPermission.notifier).update((state) => false);
    await Geolocator.requestPermission();
  }
  runApp(const ProviderScope(
    child: App(),
  ));
}
