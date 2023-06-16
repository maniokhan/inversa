// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  late final _emailController = TextEditingController();
  late final _passwordController = TextEditingController();
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
          builder: (context) => HomeScreen(
            username: userData['name'],
            profilePicUrl: userData['picture']['data']['url'],
          ),
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

  Future<void> signInWithFirebase() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      final info = credential.additionalUserInfo!.username;
      print("username: $info");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2AB0B6),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 229,
              width: 397,
              decoration: const BoxDecoration(
                color: Color(0xFF2AB0B6),
              ),
              child: Column(
                children: [],
              ),
            ),
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 34, 16, 0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        "Welcome Back!",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Color(0xFF0D223F),
                        ),
                      ),
                      gapH4,
                      const Text(
                        "Please log in to continue.",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xFF6E7A8C),
                        ),
                      ),
                      gapH24,
                      const TextFieldTitle(title: "Email", icon: Icons.email),
                      gapH8,
                      const CustomTextField(
                        hintText: "Add Email Address",
                      ),
                      gapH20,
                      const TextFieldTitle(title: "Password", icon: Icons.lock),
                      gapH8,
                      const CustomTextField(
                        hintText: "Add Password",
                        suffixicon: Icons.remove_red_eye_sharp,
                      ),
                      gapH32,
                      PrimaryButton(
                        text: 'Log In',
                        onPressed: () {},
                      ),
                      gapH20,
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account yet? ",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color(0xFF6E7A8C),
                            ),
                          ),
                          Text(
                            "Register here",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              color: Color(0xFF3CC0B8),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      gapH24,
                      const Text(
                        "- - - - - - - - - - - -  Or  - - - - - - - - - - - - -",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color(0xFFB9BAC8),
                          fontSize: 16,
                        ),
                      ),
                      gapH16,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ReusebleLinkBox(
                              onPress: () {}, icon: 'facebook_logo'),
                          ReusebleLinkBox(onPress: () {}, icon: 'google_logo'),
                          ReusebleLinkBox(onPress: () {}, icon: 'twitter_logo'),
                          ReusebleLinkBox(onPress: () {}, icon: 'mail_logol'),
                        ],
                      ),
                      gapH64,
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ReusebleLinkBox extends StatelessWidget {
  final VoidCallback onPress;
  final String icon;

  const ReusebleLinkBox({Key? key, required this.onPress, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        padding: const EdgeInsets.all(10),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: Color(0xFFE0E0E9),
          ),
        ),
        child: SvgPicture.asset(
          "assets/images/$icon.svg",
          height: 22,
          width: 22,
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData? suffixicon;
  const CustomTextField({
    Key? key,
    required this.hintText,
    this.suffixicon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(),
        ),
        suffixIcon: Icon(suffixicon),
      ),
    );
  }
}

class TextFieldTitle extends StatelessWidget {
  final String title;
  final IconData icon;
  const TextFieldTitle({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF2AB0B6)),
        gapW12,
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: Color(0xFF0D223F),
          ),
        ),
      ],
    );
  }
}
