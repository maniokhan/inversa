import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inversa/src/common_widgets/primary_button.dart';
import 'package:inversa/src/constants/app_sizes.dart';
import 'package:inversa/src/features/authentication/presentation/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  static Route<LoginScreen> route() {
    return MaterialPageRoute(builder: (context) => const LoginScreen());
  }

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const TextField(
              decoration: InputDecoration(
                hintText: "email",
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: "password",
              ),
            ),
            gapH24,
            PrimaryButton(
              text: "LOGIN",
              onPressed: () {},
            ),
            gapH12,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(FontAwesomeIcons.facebook),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(FontAwesomeIcons.google),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, SignupScreen.route());
              },
              child: const Text("SIGNUP"),
            ),
          ],
        ),
      ),
    );
  }
}
