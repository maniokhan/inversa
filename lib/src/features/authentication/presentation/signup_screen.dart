import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_button.dart';
import 'package:inversaapp/src/common_widgets/common_password.dart';
import 'package:inversaapp/src/common_widgets/common_text_field.dart';
import 'package:inversaapp/src/common_widgets/common_text_field_title.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/features/store/store_home_screen.dart';
import 'package:inversaapp/src/features/user_role_screen.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class SignupScreen extends StatefulWidget {
  static Route<SignupScreen> route() {
    return MaterialPageRoute(builder: (context) => const SignupScreen());
  }

  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late final _emailController = TextEditingController();
  late final _passwordController = TextEditingController();

  Future<void> signUpWithFirebase() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      User? user = credential.user;
      print('User ID: ${user?.uid}');
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const StoreHomeScreen(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
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
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: ConfigColors.white,
            ),
          ),
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
            "Register",
            fontWeight: FontWeight.w700,
          ),
          gapH4,
          const AppText.paragraphI16(
            "Please register to continue.",
            fontWeight: FontWeight.w500,
            color: ConfigColors.slateGray,
          ),
          gapH24,
          const CommonTextFieldTitle(
            leading: Icon(Icons.person, color: ConfigColors.primary2),
            text: 'Name',
          ),
          gapH8,
          const CommonTextField(
            hintText: "Add Name",
            textInputType: TextInputType.name,
          ),
          gapH20,
          const CommonTextFieldTitle(
            leading: Icon(Icons.phone, color: ConfigColors.primary2),
            text: 'Phone Number',
          ),
          gapH8,
          const CommonTextField(
            hintText: "Add Phone Number",
            textInputType: TextInputType.number,
          ),
          gapH20,
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
          gapH20,
          CommonTextFieldTitle(
            leading: Assets.lock.svg(),
            text: 'Confirm Password',
          ),
          gapH8,
          const CommonPasswordInput(),
          gapH26,
          Row(
            children: [
              Checkbox(
                value: true,
                onChanged: (value) {},
                activeColor: ConfigColors.primary2,
              ),
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    color: ConfigColors.slateGray,
                  ),
                  text: 'I agree with the',
                  children: [
                    TextSpan(
                      style: TextStyle(
                        color: ConfigColors.primary2,
                      ),
                      text: ' terms',
                    ),
                    TextSpan(
                      text: ' and',
                    ),
                    TextSpan(
                      style: TextStyle(
                        color: ConfigColors.primary2,
                      ),
                      text: ' conditions',
                    ),
                  ],
                ),
              ),
              // const AppText.paragraphI14(
              //   'I agree with the terms and conditions',
              //   fontWeight: FontWeight.w500,
              //   color: ConfigColors.slateGray,
              // ),
            ],
          ),
          gapH48,
          CommonButton(
            text: "Register",
            onPress: () => Navigator.push(context, UserRoleScreen.route()),
          ),
          gapH32,
        ],
      ),
    );
  }
}
