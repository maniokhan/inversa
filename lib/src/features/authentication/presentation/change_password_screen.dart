import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_button.dart';
import 'package:inversaapp/src/common_widgets/common_password.dart';
import 'package:inversaapp/src/common_widgets/common_text_field_title.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/features/authentication/presentation/authentication_provider.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class ChangePasswordScreen extends ConsumerStatefulWidget {
  static Route<ChangePasswordScreen> route() {
    return MaterialPageRoute(
        builder: (context) => const ChangePasswordScreen());
  }

  const ChangePasswordScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends ConsumerState<ChangePasswordScreen> {
  late final TextEditingController _currentPasswordController;
  late final TextEditingController _newPasswordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    _currentPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2AB0B6),
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: ConfigColors.white,
          ),
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
          CommonPasswordInput(
            controller: _currentPasswordController,
          ),
          gapH24,
          CommonTextFieldTitle(
            leading: Assets.lock.svg(),
            text: 'New Password',
          ),
          gapH8,
          CommonPasswordInput(
            controller: _newPasswordController,
          ),
          gapH24,
          CommonTextFieldTitle(
            leading: Assets.lock.svg(),
            text: 'Confirm Password',
          ),
          gapH8,
          CommonPasswordInput(
            controller: _confirmPasswordController,
          ),
          const SizedBox(height: 241),
          CommonButton(
            text: "Save",
            onPress: () async {
              await ref.read(authenticationProvider.notifier).changePassword(
                    _currentPasswordController.text,
                    _newPasswordController.text,
                    _confirmPasswordController.text,
                  );
            },
          ),
        ],
      ),
    );
  }
}
