import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/features/authentication/presentation/authentication_notifier.dart';
import 'package:inversaapp/src/features/authentication/presentation/logged_in_provider.dart';
import 'package:inversaapp/src/features/authentication/presentation/sign_in_screen.dart';
import 'package:inversaapp/src/features/authentication/presentation/signup_screen.dart';
import 'package:inversaapp/src/features/store/store_nav_bar.dart';
import 'package:inversaapp/src/helpers/loading_screen.dart';
import 'package:inversaapp/src/providers/is_loading_provider.dart';
import 'package:inversaapp/src/theme/data.dart';
import 'package:inversaapp/src/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
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
    final AuthState state = ref.watch(loggedInProvider);

    ref.listen(isLoadingProvider, (bool? previous, bool next) {
      if (next) {
        LoadingScreen().show(context: context, text: "Please wait");
      } else {
        LoadingScreen().hide();
      }
    });

    if (state == AuthState.loggedIn) {
      return const StoreNavigationBar();
    } else if (state == AuthState.logout) {
      return const LoginScreen();
    } else if (state == AuthState.notRegistered) {
      return const SignupScreen();
    } else {
      return const LoginScreen();
    }
  }
}
