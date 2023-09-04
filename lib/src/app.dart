import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/main.dart';
import 'package:inversaapp/src/features/authentication/presentation/screens/sign_in_screen.dart';
import 'package:inversaapp/src/features/authentication/presentation/screens/user_role_screen.dart';
import 'package:inversaapp/src/helpers/loading_screen.dart';
import 'package:inversaapp/src/providers/is_loading_provider.dart';
import 'package:inversaapp/src/theme/data.dart';
import 'package:inversaapp/src/theme/theme.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, ref) {
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
    ref.listen(isLoadingProvider, (previous, next) {
      if (next) {
        LoadingScreen().show(context: context, text: "Please wait");
      } else {
        LoadingScreen().hide();
      }
    });
    final isLoggin = appPrefs?.getBool('isLoggin') ?? false;
    if (isLoggin) {
      return UserRoleScreen();
    } else {
      return const LoginScreen();
    }
  }
}
