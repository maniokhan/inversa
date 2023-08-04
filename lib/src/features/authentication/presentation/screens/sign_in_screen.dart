import 'dart:developer' as devtools show log;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_button.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/common_widgets/common_password.dart';
import 'package:inversaapp/src/common_widgets/common_scaffold.dart';
import 'package:inversaapp/src/common_widgets/common_text_field.dart';
import 'package:inversaapp/src/common_widgets/common_text_field_title.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/features/authentication/presentation/provider/authentication_notifier.dart';
import 'package:inversaapp/src/features/authentication/presentation/provider/authentication_provider.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

extension Log on Object {
  void log() => devtools.log(toString());
}

class LoginScreen extends ConsumerStatefulWidget {
  static Route<LoginScreen> route() {
    return MaterialPageRoute(builder: (context) => const LoginScreen());
  }

  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late final _emailController = TextEditingController();
  late final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      isScaffold: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          toolbarHeight: 120,
          backgroundColor: const Color(0xFF2AB0B6),
          elevation: 0,
          centerTitle: true,
          title: Column(
            children: [
              gapH16,
              Assets.appLogo.svg(height: 30, width: 30),
              gapH12,
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
              await ref.read(authenticationProvider.notifier).loginAccount(
                    _emailController.text,
                    _passwordController.text,
                  );
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
                onTap: () {
                  ref.read(authenticationProvider.notifier).changeState(
                        AuthState.notRegistered,
                      );
                },
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
                onTap: () async {
                  await ref
                      .read(authenticationProvider.notifier)
                      .loginWithGoogle();
                },
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
