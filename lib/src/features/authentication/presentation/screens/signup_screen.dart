import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_button.dart';
import 'package:inversaapp/src/common_widgets/common_check_box.dart';
import 'package:inversaapp/src/common_widgets/common_password.dart';
import 'package:inversaapp/src/common_widgets/common_text_field.dart';
import 'package:inversaapp/src/common_widgets/common_text_field_title.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/features/authentication/presentation/provider/authentication_provider.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class SignupScreen extends ConsumerStatefulWidget {
  static Route<SignupScreen> route() {
    return MaterialPageRoute(builder: (context) => const SignupScreen());
  }

  const SignupScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _phoneNumberController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    super.initState();
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
            onPressed: () => Navigator.pop(context),
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
          CommonTextField(
            controller: _nameController,
            hintText: "Add Name",
            textInputType: TextInputType.name,
          ),
          gapH20,
          const CommonTextFieldTitle(
            leading: Icon(Icons.phone, color: ConfigColors.primary2),
            text: 'Phone Number',
          ),
          gapH8,
          CommonTextField(
            controller: _phoneNumberController,
            hintText: "Add Phone Number",
            textInputType: TextInputType.number,
          ),
          gapH20,
          CommonTextFieldTitle(
            leading: Assets.emailGreen.svg(),
            text: 'Email',
          ),
          gapH8,
          CommonTextField(
            hintText: "Add Email Address",
            textInputType: TextInputType.emailAddress,
            controller: _emailController,
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
          gapH20,
          gapH26,
          Row(
            children: [
              const CommonCheckBox(),
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
            ],
          ),
          gapH48,
          CommonButton(
            text: "Register",
            onPress: () async {
              await ref.read(authenticationProvider.notifier).resgiterAccount(
                email: _emailController.text,
                password: _passwordController.text,
                data: {
                  'name': _nameController.text,
                  'phone': _phoneNumberController.text,
                  'email': _emailController.text,
                  'password': _passwordController.text,
                },
              );
            },
          ),
          gapH32,
        ],
      ),
    );
  }
}
