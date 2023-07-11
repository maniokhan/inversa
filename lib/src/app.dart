import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/features/authentication/presentation/authentication_notifier.dart';
import 'package:inversaapp/src/features/authentication/presentation/authentication_provider.dart';
import 'package:inversaapp/src/features/authentication/presentation/sign_in_screen.dart';
import 'package:inversaapp/src/features/authentication/presentation/signup_screen.dart';
import 'package:inversaapp/src/features/store/store_nav_bar.dart';
import 'package:inversaapp/src/helpers/loading_screen.dart';
import 'package:inversaapp/src/theme/data.dart';
import 'package:inversaapp/src/theme/theme.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, ref) {
    ref.read(authenticationProvider.notifier).initAccount();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('en'),
      supportedLocales: const <Locale>[
        Locale('fr'),
        Locale('en'),
      ],
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: const MyApp(),
      builder: (BuildContext context, Widget? child) {
        return AppTheme(
          data: const AppThemeData(),
          child: child!,
        );
      },
    );
  }
}

class MyApp extends ConsumerWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(authenticationProvider);

    ref.listen(authenticationProvider, (previous, next) {
      if (next.isLoading) {
        LoadingScreen().show(context: context, text: "Please wait");
      } else {
        LoadingScreen().hide();
      }
    });

    switch (state.authState) {
      case AuthState.notRegistered:
        log("AuthState.notRegistered");
        return const SignupScreen();
      case AuthState.loggedIn:
        log("AuthState.loggedIn");
        return const StoreNavigationBar();
      default:
        log("default");
        return const LoginScreen();
    }
  }
}
