import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/features/authentication/presentation/provider/authentication_notifier.dart';
import 'package:inversaapp/src/features/authentication/presentation/provider/authentication_provider.dart';
import 'package:inversaapp/src/features/authentication/presentation/screens/sign_in_screen.dart';
import 'package:inversaapp/src/features/authentication/presentation/screens/signup_screen.dart';
import 'package:inversaapp/src/features/home/presentation/screens/client_nav_bar.dart';
import 'package:inversaapp/src/features/home/presentation/screens/store_nav_bar.dart';
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
    final state = ref.watch(authenticationProvider);

    ref.listen(isLoadingProvider, (previous, next) {
      if (next) {
        LoadingScreen().show(context: context, text: "Please wait");
      } else {
        LoadingScreen().hide();
      }
    });

    switch (state.authState) {
      case AuthState.notRegistered:
        return const SignupScreen();
      case AuthState.storeLoggedIn:
        return const StoreNavigationBar();
      case AuthState.clientLoggedIn:
        return const ClientNavigationBar();
      case AuthState.selectRole:
        return UserRoleScreen();
      case AuthState.logout:
        return const LoginScreen();
      default:
        return const LoginScreen();
    }
  }
}
