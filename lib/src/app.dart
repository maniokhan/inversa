import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:inversa/src/features/authentication/presentation/sign_in_screen.dart';
import 'package:inversa/src/theme/data.dart';
import 'package:inversa/src/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: const LoginScreen(),
      builder: (BuildContext context, Widget? child) {
        return AppTheme(
          data: const AppThemeData(),
          child: child!,
        );
      },
    );
  }
}
