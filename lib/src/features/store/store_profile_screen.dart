import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/common_widgets/common_list_tile.dart';
import 'package:inversaapp/src/common_widgets/common_text_field_title.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/features/authentication/presentation/authentication_provider.dart';
import 'package:inversaapp/src/features/authentication/presentation/change_password_screen.dart';
import 'package:inversaapp/src/features/store/store_business_profile_form_screen.dart';
import 'package:inversaapp/src/features/user_account_provider.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class StoreProfileScreen extends ConsumerWidget {
  static Route<StoreProfileScreen> route() {
    return MaterialPageRoute(builder: (context) => const StoreProfileScreen());
  }

  const StoreProfileScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final userData = ref.watch(userAccountProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2AB0B6),
        elevation: 0,
        centerTitle: true,
        title: const AppText.titleS20(
          "Store",
          color: ConfigColors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: userData.when(
        data: (data) {
          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 25, 16, 0),
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
                            maxLines: 2,
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
              // TODO: add shadow arround cards
              CommonListTile(
                onTap: () {},
                leading: CommonCard(
                  customRadius: BorderRadius.circular(10),
                  showShadow: false,
                  backgroundColor: const Color.fromRGBO(195, 121, 255, 0.1),
                  padding: const EdgeInsets.all(6),
                  //TODO: client image not shown error
                  child: Assets.clientPng.image(
                    color: const Color(0xFFC379FF),
                    height: 26,
                    width: 26,
                  ),
                ),
                title: const AppText.paragraphI16(
                  "Client",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                trailing: Assets.outlinedForwardArrow.svg(),
              ),
              gapH12,
              CommonListTile(
                onTap: () =>
                    Navigator.push(context, ChangePasswordScreen.route()),
                leading: CommonCard(
                  customRadius: BorderRadius.circular(10),
                  showShadow: false,
                  backgroundColor: const Color.fromRGBO(195, 121, 255, 0.1),
                  padding: const EdgeInsets.all(10),
                  child: Assets.lock.svg(color: const Color(0xFFFF7B9A)),
                ),
                title: const AppText.paragraphI16(
                  "Change Password",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                trailing: Assets.outlinedForwardArrow.svg(),
              ),
              gapH12,
              CommonListTile(
                onTap: () {},
                leading: CommonCard(
                  customRadius: BorderRadius.circular(10),
                  showShadow: false,
                  backgroundColor: ConfigColors.lightPink,
                  padding: const EdgeInsets.all(10),
                  child:
                      Assets.bankLightOrange.svg(color: ConfigColors.pink700),
                ),
                title: const AppText.paragraphI16(
                  "Bank",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                trailing: Assets.outlinedForwardArrow.svg(),
              ),
              gapH12,
              CommonListTile(
                onTap: () {},
                leading: CommonCard(
                  customRadius: BorderRadius.circular(10),
                  showShadow: false,
                  backgroundColor: ConfigColors.backgroundGreen,
                  padding: const EdgeInsets.all(10),
                  child: Assets.helpLightGreen.svg(),
                ),
                title: const AppText.paragraphI16(
                  "Help",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                trailing: Assets.outlinedForwardArrow.svg(),
              ),
              gapH12,
              CommonListTile(
                onTap: () {},
                leading: CommonCard(
                  customRadius: BorderRadius.circular(10),
                  showShadow: false,
                  backgroundColor: ConfigColors.lightFerozi,
                  padding: const EdgeInsets.all(10),
                  child: Assets.termConditionFerozi.svg(),
                ),
                title: const AppText.paragraphI16(
                  "Terms & Conditions",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                trailing: Assets.outlinedForwardArrow.svg(),
              ),
              gapH12,
              CommonListTile(
                onTap: () => showCupertinoDialog(context, ref),
                leading: CommonCard(
                  customRadius: BorderRadius.circular(10),
                  showShadow: false,
                  backgroundColor: ConfigColors.backgroundRed,
                  padding: const EdgeInsets.all(10),
                  child: Assets.logoutLightRed.svg(),
                ),
                title: const AppText.paragraphI16(
                  "Log Out",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: ConfigColors.whatsapp,
                ),
                trailing: const Text(''),
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
