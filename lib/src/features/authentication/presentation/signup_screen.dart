import 'package:flutter/material.dart';
import 'package:inversa/src/constants/app_sizes.dart';

class SignupScreen extends StatelessWidget {
  static Route<SignupScreen> route() {
    return MaterialPageRoute(builder: (context) => const SignupScreen());
  }

  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SIGNUP"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
          const TextField(
            decoration: InputDecoration(
              hintText: "confirm password",
            ),
          ),
          gapH24,
        ],
      ),
    );
  }
}
