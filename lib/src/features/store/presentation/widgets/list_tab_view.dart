import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/common_widgets/common_button.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/common_widgets/common_check_box.dart';
import 'package:inversaapp/src/common_widgets/common_list_tile.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/features/store/presentation/provider/all_products_providers.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class ListTabView extends ConsumerWidget {
  const ListTabView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final String? userId = FirebaseAuth.instance.currentUser?.uid;

    final allItems = ref.watch(allProductsProvider(userId));
    return allItems.when(
      data: (data) {
        if (data.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 22, 16, 16),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: data.length,
                    separatorBuilder: (context, index) => gapH16,
                    itemBuilder: (context, index) {
                      final product = data.elementAt(index);
                      return CommonListTile(
                        padding: const EdgeInsets.all(10),
                        leading: CommonCard(
                          height: 71,
                          width: 76,
                          padding: const EdgeInsets.all(10),
                          backgroundColor: const Color(0xFFf2f2f2),
                          child: CachedNetworkImage(
                            imageUrl: product["image"],
                          ),
                        ),
                        title: AppText.paragraphI16(
                          product['name'],
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                        subTitle: const AppText.paragraphI14(
                          "Exp Date: 10/06/2023",
                          fontWeight: FontWeight.w400,
                          color: ConfigColors.slateGray,
                        ),
                        trailing: const CommonCheckBox(),
                      );
                    },
                  ),
                ),
                gapH26,
                Center(
                  child: CommonCard(
                    height: 33,
                    width: 132,
                    borderColor: const Color(0xFF4794F9),
                    onTap: () {},
                    customRadius: BorderRadius.circular(6),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
                    backgroundColor: ConfigColors.backgroundGreen,
                    showBorder: true,
                    alignment: Alignment.center,
                    child: const AppText.paragraphI12(
                      "Download List",
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF4794F9),
                    ),
                  ),
                ),
                gapH26,
                Row(
                  children: [
                    Expanded(
                      child: CommonButton(
                        onPress: () {},
                        prefixIcon: true,
                        prefixIconData: Icons.search,
                        text: "Search",
                      ),
                    ),
                    gapW20,
                    Expanded(
                      child: CommonButton(
                        onPress: () {},
                        text: "Save",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: AppText.paragraphI16("No Products Available"),
          );
        }
      },
      error: (error, stackTrace) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
