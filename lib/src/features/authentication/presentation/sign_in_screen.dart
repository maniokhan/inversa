// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:inversa/src/assets/assets.gen.dart';
import 'package:inversa/src/common_widgets/common_button.dart';
import 'package:inversa/src/common_widgets/common_card.dart';
import 'package:inversa/src/common_widgets/common_password.dart';
import 'package:inversa/src/common_widgets/common_text_field.dart';
import 'package:inversa/src/common_widgets/common_text_field_title.dart';
import 'package:inversa/src/constants/app_sizes.dart';
import 'package:inversa/src/features/authentication/presentation/signup_screen.dart';
import 'package:inversa/src/features/store/store_home_screen.dart';
import 'package:inversa/src/theme/config_colors.dart';
import 'package:inversa/src/theme/text.dart';

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
          builder: (context) => const StoreHomeScreen(),
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          toolbarHeight: 90,
          backgroundColor: const Color(0xFF2AB0B6),
          elevation: 0,
          centerTitle: true,
          title: Column(
            children: [
              gapH12,
              Assets.appLogo.svg(height: 30, width: 30),
              gapH4,
              const AppText.paragraphI14('monitor the inventories'),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 34, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppText.titleS20(
                "Welcome Back!",
                fontSize: 24,
                color: ConfigColors.black,
                fontWeight: FontWeight.w700,
              ),
              gapH4,
              const AppText.paragraphI14(
                "Please log in to continue.",
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: ConfigColors.slateGray,
              ),
              gapH24,
              CommonTextFieldTitle(
                leading: Assets.emailGreen.svg(),
                text: 'Email',
              ),
              gapH8,
              const CommonTextField(
                hintText: "Add Email Address",
                textInputType: TextInputType.emailAddress,
              ),
              gapH20,
              CommonTextFieldTitle(
                leading: Assets.lock.svg(),
                text: 'Password',
              ),
              gapH8,
              const CommonPasswordInput(),
              gapH32,
              CommonButton(
                text: "Log In",
                onPress: () => Navigator.push(context, StoreHomeScreen.route()),
              ),
              gapH20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AppText.paragraphI12(
                    "Don't have an account yet? ",
                    fontWeight: FontWeight.w500,
                    // fontSize: 12,
                    color: ConfigColors.lightText,
                  ),
                  InkWell(
                    onTap: () => Navigator.push(context, SignupScreen.route()),
                    child: const AppText.paragraphI12(
                      "Register here",
                      fontWeight: FontWeight.w700,
                      color: ConfigColors.primary2,
                      // decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              gapH24,
              const AppText.paragraphI14(
                "- - - - - - - - - - - - - -  - -  Or  - - - - - - - - - - - - - - - - - ",
                textAlign: TextAlign.center,
                color: ConfigColors.blueGrey,
              ),
              gapH16,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonCard(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(14),
                    customRadius: BorderRadius.circular(14),
                    showBorder: true,
                    child: Assets.facebook.svg(),
                  ),
                  gapW16,
                  CommonCard(
                    alignment: Alignment.center,
                    customRadius: BorderRadius.circular(14),
                    padding: const EdgeInsets.all(14),
                    showBorder: true,
                    child: Assets.google.svg(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
