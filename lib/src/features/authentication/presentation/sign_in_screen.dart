// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:inversa_sdk/inversa_sdk.dart' as sdk;
// import 'package:inversa_sdk/src/features/authentication/login_with_firebase.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_button.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/common_widgets/common_password.dart';
import 'package:inversaapp/src/common_widgets/common_text_field.dart';
import 'package:inversaapp/src/common_widgets/common_text_field_title.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/features/authentication/presentation/signup_screen.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

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

  // void _logInWithFacebook() async {
  //   setState(() {
  //     isLoggedIn = true;
  //   });
  //   try {
  //     // final result = await FacebookAuth.instance.login();
  //     // final userData = await FacebookAuth.instance.getUserData();
  //     // final facebookAuthCredential =
  //     //     FacebookAuthProvider.credential(result.accessToken!.token);
  //     // await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

  //     Navigator.of(context).push(
  //       MaterialPageRoute(
  //         builder: (context) => const StoreHomeScreen(),
  //       ),
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     Navigator.pop(context);
  //     print('Error: $e');

  //     showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           content: Text(e.toString(),
  //               style: const TextStyle(color: Colors.black, fontSize: 15)),
  //           contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
  //         );
  //       },
  //     );
  //   } finally {
  //     setState(() {
  //       isLoggedIn = false;
  //     });
  //   }
  // }

  // Future<void> signInWithFirebase() async {
  //   try {
  //     final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: _emailController.text,
  //       password: _passwordController.text,
  //     );

  //     final info = credential.additionalUserInfo!.username;
  //     print("username: $info");
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       print('No user found for that email.');
  //     } else if (e.code == 'wrong-password') {
  //       print('Wrong password provided for that user.');
  //     }
  //   }
  // }

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
              const AppText.paragraphI14(
                'monitor the inventories',
                color: ConfigColors.white,
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 34, 16, 0),
        children: [
          const AppText.titleS24(
            "Welcome Back!",
            color: ConfigColors.black,
            fontWeight: FontWeight.w700,
          ),
          gapH4,
          const AppText.paragraphI16(
            "Please log in to continue.",
            fontWeight: FontWeight.w500,
            color: ConfigColors.slateGray,
          ),
          gapH24,
          CommonTextFieldTitle(
            leading: Assets.emailGreen.svg(),
            text: 'Email',
          ),
          gapH8,
          CommonTextField(
            controller: _emailController,
            hintText: "Add Email Address",
            textInputType: TextInputType.emailAddress,
          ),
          gapH20,
          CommonTextFieldTitle(
            leading: Assets.lock.svg(),
            text: 'Password',
          ),
          gapH8,
          CommonPasswordInput(
            controller: _passwordController,
          ),
          gapH32,
          CommonButton(
            text: "Log In",
            onPress: () async {
              await sdk.Authentication.loginWithFirebase(
                _emailController.text,
                _passwordController.text,
              );
              // await sdk.Authentication.logout();
            },
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
                  textDecoration: TextDecoration.underline,
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
                onTap: () {},
                alignment: Alignment.center,
                padding: const EdgeInsets.all(14),
                customRadius: BorderRadius.circular(14),
                showBorder: true,
                child: Assets.facebook.svg(),
              ),
              gapW16,
              CommonCard(
                onTap: () {},
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
    );
  }
}
