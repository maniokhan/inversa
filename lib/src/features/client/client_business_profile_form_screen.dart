import 'package:flutter/material.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_button.dart';
import 'package:inversaapp/src/common_widgets/common_text_field.dart';
import 'package:inversaapp/src/common_widgets/common_text_field_title.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class ClientBusinessProfileFormScreen extends StatelessWidget {
  const ClientBusinessProfileFormScreen({super.key});

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
          "Business Profile",
          color: ConfigColors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
        children: [
          // TODO:  Client icon not shown
          CommonTextFieldTitle(
            leading: Assets.store.svg(color: ConfigColors.primary2),
            text: 'Name of Client',
          ),
          gapH8,
          const CommonTextField(
            hintText: "Add Client",
            textInputType: TextInputType.name,
          ),
          gapH24,
          CommonTextFieldTitle(
            leading: Assets.address.svg(),
            text: 'Address',
          ),
          gapH8,
          const CommonTextField(
            hintText: "Add Address",
            textInputType: TextInputType.streetAddress,
          ),
          gapH24,
          CommonTextFieldTitle(
            leading: Assets.emailGreen.svg(),
            text: 'Email',
          ),
          gapH8,
          const CommonTextField(
            hintText: "info@gmail.com",
            textInputType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 241),
          CommonButton(text: "Save", onPress: () {}),
        ],
      ),
    );
  }
}
