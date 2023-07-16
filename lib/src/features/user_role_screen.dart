// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/features/authentication/presentation/authentication_notifier.dart';
import 'package:inversaapp/src/features/authentication/presentation/authentication_provider.dart';
import 'package:inversaapp/src/features/user_account_notifier_provider.dart';
import 'package:inversaapp/src/features/user_account_provider.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

enum Role { store, client }

class UserRoleScreen extends ConsumerWidget {
  UserRoleScreen({super.key});

  static Route<UserRoleScreen> route() {
    return MaterialPageRoute(builder: (context) => UserRoleScreen());
  }

  Role selcectedRole = Role.client;

  @override
  Widget build(BuildContext context, ref) {
    final userAccountValue = ref.watch(userAccountProvider);

    return Scaffold(
      body: userAccountValue.when(
        data: (data) {
          selcectedRole = data["role"] == "store" ? Role.store : Role.client;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              gapH54,
              Padding(
                padding: const EdgeInsets.only(left: 23),
                child: CommonCard(
                  onTap: () => Navigator.pop(context),
                  padding: const EdgeInsets.all(8),
                  shape: BoxShape.circle,
                  backgroundColor: ConfigColors.primary2,
                  child: Assets.closeGrey.svg(color: ConfigColors.white),
                ),
              ),
              gapH20,
              Card(
                elevation: 0,
                color: Colors.transparent,
                child: ListTile(
                  onTap: () async {
                    if (selcectedRole == Role.client) {
                      ref
                          .read(authenticationProvider.notifier)
                          .changeState(AuthState.clientLoggedIn);
                    } else {
                      ref
                          .read(authenticationProvider.notifier)
                          .changeState(AuthState.storeLoggedIn);
                    }
                  },
                  leading: const CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage("assets/images/profile.jpg"),
                  ),
                  title: const AppText.paragraphI16(
                    "Chandrama Saha",
                    fontWeight: FontWeight.w700,
                  ),
                  subtitle: const Row(
                    children: [
                      AppText.paragraphI14(
                        "View Profile",
                        fontWeight: FontWeight.w400,
                        color: ConfigColors.slateGray,
                      ),
                      Icon(
                        Icons.arrow_forward_sharp,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
              gapH20,
              const Divider(height: 1, color: ConfigColors.blueGrey),
              gapH16,
              const Center(
                child: Column(
                  children: [
                    AppText.titleS24(
                      "Select role",
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                    gapH8,
                    AppText.paragraphI14(
                      "Please select your role in the app.",
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: ConfigColors.slateGray,
                    ),
                  ],
                ),
              ),
              gapH32,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CommonCard(
                  height: 135,
                  width: 343,
                  onTap: () async {
                    await ref
                        .read(userAccountNotifierProvider.notifier)
                        .updateUserAccount(
                      documentId: data["documentId"],
                      data: {"role": "store"},
                    );
                  },
                  alignment: Alignment.center,
                  showBorder: selcectedRole == Role.store ? true : false,
                  borderColor: selcectedRole == Role.store
                      ? ConfigColors.primary2
                      : null,
                  showShadow: true,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Assets.store.svg(
                        height: 40,
                        color: selcectedRole == Role.store
                            ? ConfigColors.primary2
                            : ConfigColors.slateGray,
                      ),
                      gapH16,
                      const AppText.paragraphI16(
                        "Switch to Store",
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: ConfigColors.slateGray,
                      ),
                    ],
                  ),
                ),
              ),
              gapH20,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CommonCard(
                  height: 135,
                  width: 343,
                  onTap: () async {
                    await ref
                        .read(userAccountNotifierProvider.notifier)
                        .updateUserAccount(
                      documentId: data["documentId"],
                      data: {"role": "client"},
                    );
                  },
                  alignment: Alignment.center,
                  showShadow: true,
                  showBorder: selcectedRole == Role.client ? true : false,
                  borderColor: selcectedRole == Role.client
                      ? ConfigColors.primary2
                      : null,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // TODO:  Client icon not shown
                      selcectedRole == Role.client
                          ? Assets.clientRoleGreen.image(
                              height: 70,
                              width: 60,
                            )
                          : Assets.clientRole.image(
                              height: 70,
                              width: 60,
                            ),
                      const AppText.paragraphI16(
                        "Switch to Client",
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: ConfigColors.slateGray,
                      ),
                    ],
                  ),
                ),
              ),
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
