import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  runApp(const ProviderScope(child: App()));
}
