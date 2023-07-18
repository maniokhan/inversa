import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/common_widgets/common_list_tile.dart';
import 'package:inversaapp/src/common_widgets/common_profile_list_tile.dart';
import 'package:inversaapp/src/common_widgets/common_text_field_title.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/features/authentication/presentation/provider/authentication_provider.dart';
import 'package:inversaapp/src/features/authentication/presentation/screens/change_password_screen.dart';
import 'package:inversaapp/src/features/profile/presentation/provider/user_account_provider.dart';
import 'package:inversaapp/src/features/profile/presentation/screens/store_business_profile_form_screen.dart';
import 'package:inversaapp/src/features/store/presentation/screens/all_stores_screen.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class ClientProfileScreen extends ConsumerWidget {
  static Route<ClientProfileScreen> route() {
    return MaterialPageRoute(builder: (context) => const ClientProfileScreen());
  }

  const ClientProfileScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final userData = ref.watch(userAccountProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2AB0B6),
        elevation: 0,
        centerTitle: true,
        title: const AppText.titleS20(
          "Client",
          color: ConfigColors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: userData.when(
        data: (data) {
          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 26, 16, 0),
            children: [
              CommonCard(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF011627),
                    Color(0xFF2AB0B6),
                  ],
                ),
                backgroundColor: ConfigColors.primary2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText.titleS20(
                            data['store_name'],
                            color: ConfigColors.white,
                          ),
                          CommonCard(
                            onTap: () => Navigator.push(context,
                                StoreBusinessProfileFormScreen.route()),
                            showShadow: false,
                            showBorder: true,
                            shape: BoxShape.circle,
                            backgroundColor: ConfigColors.primary2,
                            padding: const EdgeInsets.all(6),
                            child: Assets.editWhite.svg(),
                          ),
                        ]),
                    gapH8,
                    SizedBox(
                      width: 275,
                      child: AppText.paragraphI12(
                        data['address'],
                        maxLines: 2,
                        color: ConfigColors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    gapH8,
                    CommonTextFieldTitle(
                      leading: Assets.email.svg(
                        color: ConfigColors.white,
                      ),
                      text: data['email'],
                      textColor: ConfigColors.white,
                    ),
                  ],
                ),
              ),
              gapH20,
              const AppText.titleS20(
                "More Options",
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              gapH16,
              CommonProfileListTile(
                backgroundColor: const Color.fromRGBO(195, 121, 255, 0.1),
                title: 'Store',
                icon: Assets.clientPng.image(
                  color: const Color(0xFFC379FF),
                  height: 26,
                  width: 26,
                ),
                onTap: () => Navigator.push(context, AllStoresScreen.route()),
              ),
              gapH12,
              CommonProfileListTile(
                backgroundColor: const Color.fromRGBO(195, 121, 255, 0.1),
                title: "Change Password",
                icon: Assets.lock.svg(color: const Color(0xFFFF7B9A)),
                onTap: () =>
                    Navigator.push(context, ChangePasswordScreen.route()),
              ),
              gapH12,
              CommonProfileListTile(
                backgroundColor: ConfigColors.lightPink,
                title: 'Bank',
                icon: Assets.bankLightOrange.svg(color: ConfigColors.pink700),
                onTap: () {},
              ),
              gapH12,
              CommonProfileListTile(
                backgroundColor: ConfigColors.backgroundGreen,
                title: "Help",
                icon: Assets.helpLightGreen.svg(),
                onTap: () {},
              ),
              gapH12,
              CommonProfileListTile(
                backgroundColor: ConfigColors.lightFerozi,
                title: "Terms & Conditions",
                icon: Assets.termConditionFerozi.svg(),
                onTap: () {},
              ),
              gapH12,
              CommonProfileListTile(
                showTrailing: false,
                backgroundColor: ConfigColors.backgroundRed,
                title: 'Log out',
                icon: Assets.logoutLightRed.svg(),
                onTap: () => showCupertinoDialog(context, ref),
              ),
              gapH32,
              
            ],
          );
        },
        error: (error, stackTrace) {
          return null;
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

void showCupertinoDialog(BuildContext context, WidgetRef ref) {
  showDialog(
    context: context,
    builder: ((context) {
      return CupertinoAlertDialog(
        title: const AppText.paragraphI16(
          "Log Out ",
          fontWeight: FontWeight.w600,
        ),
        content: const AppText.paragraphI14(
          "Are you sure you want to logout ? ",
          color: ConfigColors.slateGray,
        ),
        actions: [
          CupertinoDialogAction(
            child: const AppText.paragraphI16(
              "No",
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
            onPressed: () {
              Navigator.pop(context); // Close the dialog
            },
          ),
          CupertinoDialogAction(
            child: const AppText.paragraphI16(
              "Yes",
              fontSize: 17,
              color: ConfigColors.primary2,
              fontWeight: FontWeight.w500,
            ),
            onPressed: () async {
              await ref.read(authenticationProvider.notifier).logoutAccount();
              await Future.delayed(const Duration(microseconds: 200),
                  () => Navigator.pop(context));
            },
          ),
        ],
      );
    }),
  );
}
