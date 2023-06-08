import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:inversa/src/common_widgets/primary_button.dart';
import 'package:inversa/src/constants/app_sizes.dart';
import 'package:inversa/src/features/authentication/presentation/auth_service.dart';
import 'package:inversa/src/features/authentication/presentation/signup_screen.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  static Route<LoginScreen> route() {
    return MaterialPageRoute(builder: (context) => const LoginScreen());
  }

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoggedIn = false;

  void _logInWithFacebook() async {
    setState(() {
      isLoggedIn = true;
    });
    try {
      final result = await FacebookAuth.instance.login();
      final userData = await FacebookAuth.instance.getUserData();
      final facebookAuthCredential =
          FacebookAuthProvider.credential(result.accessToken!.token);
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      await FirebaseFirestore.instance.collection("users").add({
        'email': userData['email'],
        'imageUrl': userData['picture']['data']['url'],
        'name': userData['name'],
      });
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      print('Error: $e');

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.toString(),
                style: const TextStyle(color: Colors.black, fontSize: 15)),
            contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          );
        },
      );
    } finally {
      setState(() {
        isLoggedIn = false;
      });
    }
  }

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
                  onPressed: () {
                    _logInWithFacebook();
                  },
                  icon: const Icon(FontAwesomeIcons.facebook),
                ),
                IconButton(
                  onPressed: () {
                    AuthService.signInWithGoogle();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
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
            TextButton(
              onPressed: () {
                Navigator.push(context, SignupScreen.route());
              },
              child: const Text("Sign"),
            ),
          ],
        ),
      ),
    );
  }
}
