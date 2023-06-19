import 'package:flutter/material.dart';
import 'package:inversa/src/assets/assets.gen.dart';
import 'package:inversa/src/common_widgets/common_button.dart';
import 'package:inversa/src/common_widgets/common_password.dart';
import 'package:inversa/src/common_widgets/common_text_field_title.dart';
import 'package:inversa/src/constants/app_sizes.dart';
import 'package:inversa/src/theme/config_colors.dart';
import 'package:inversa/src/theme/text.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2AB0B6),
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back_ios_new_outlined,
          color: ConfigColors.white,
        ),
        centerTitle: true,
        title: const AppText.titleS20(
          "Change Password",
          color: ConfigColors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
        children: [
          CommonTextFieldTitle(
            leading: Assets.lock.svg(),
            text: 'Current Password',
          ),
          gapH8,
          const CommonPasswordInput(),
          gapH24,
          CommonTextFieldTitle(
            leading: Assets.lock.svg(),
            text: 'New Password',
          ),
          gapH8,
          const CommonPasswordInput(),
          gapH24,
          CommonTextFieldTitle(
            leading: Assets.lock.svg(),
            text: 'Confirm Password',
          ),
          gapH8,
          const CommonPasswordInput(),
          const SizedBox(height: 241),
          CommonButton(
            text: "Save",
            onPress: () {},
          ),
        ],
      ),
    );
  }
}
