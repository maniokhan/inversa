import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/firebase_options.dart';
import 'package:inversaapp/src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.remove();
  await Firebase.initializeApp(
    name: 'inversappmx',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: App()));
}
