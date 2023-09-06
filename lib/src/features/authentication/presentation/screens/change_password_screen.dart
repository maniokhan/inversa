import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_app_bar.dart';
import 'package:inversaapp/src/common_widgets/common_button.dart';
import 'package:inversaapp/src/common_widgets/common_password.dart';
import 'package:inversaapp/src/common_widgets/common_scaffold.dart';
import 'package:inversaapp/src/common_widgets/common_text_field_title.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/features/authentication/presentation/provider/authentication_provider.dart';
import 'package:inversaapp/src/features/profile/presentation/provider/user_account_notifier_provider.dart';
import 'package:inversaapp/src/features/profile/presentation/provider/user_account_provider.dart';
import 'package:inversaapp/src/helpers/loading_screen.dart';
import 'package:inversaapp/src/theme/config_colors.dart';

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
  // late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    _currentPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    // _confirmPasswordController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userAccountValue = ref.watch(userAccountProvider);
    return Scaffold(
      body: CommonScaffold(
        appBar: CommonAppBar(
          showleading: true,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: ConfigColors.white,
            ),
          ),
          title: "Change Password",
        ),
        body: userAccountValue.when(
          data: (data) {
            _currentPasswordController.text = data['password'].toString();
            return ListView(
              physics: const NeverScrollableScrollPhysics(),
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
                // gapH24,
                // CommonTextFieldTitle(
                //   leading: Assets.lock.svg(),
                //   text: 'Confirm Password',
                // ),
                // gapH8,
                // CommonPasswordInput(
                //   controller: _confirmPasswordController,
                // ),
                const SizedBox(height: 340),
                // const Spacer(),
                CommonButton(
                  text: "Save",
                  onPress: () async {
                    try {
                      LoadingScreen()
                          .show(context: context, text: 'Please wait');
                      await ref
                          .read(authenticationProvider.notifier)
                          .changePassword(
                            _newPasswordController.text,
                          );
                      await ref
                          .read(userAccountNotifierProvider.notifier)
                          .updateUserAccount(
                        documentId: data["documentId"],
                        data: {
                          "password": _newPasswordController.text,
                        },
                      );
                      await Future.delayed(const Duration(milliseconds: 100),
                          () {
                        LoadingScreen().hide();
                        Navigator.pop(context);
                      });
                    } catch (e) {
                      LoadingScreen().hide();
                    }
                  },
                ),
              ],
            );
          },
          error: (error, stackTrace) {
            return const Center(
              child: Text("Something went wrong"),
            );
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
