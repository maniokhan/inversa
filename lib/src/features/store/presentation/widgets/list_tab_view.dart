import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/common_widgets/common_button.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/common_widgets/common_check_box.dart';
import 'package:inversaapp/src/common_widgets/common_list_tile.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/features/store/presentation/provider/all_products_providers.dart';
import 'package:inversaapp/src/features/store/presentation/screens/compare_screen.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class ListTabView extends ConsumerStatefulWidget {
  const ListTabView({super.key});

  @override
  ConsumerState<ListTabView> createState() => _ListTabViewState();
}

class _ListTabViewState extends ConsumerState<ListTabView> {
  List<Map<String, dynamic>> checkedProducts = [];

  @override
  Widget build(BuildContext context) {
    final String? userId = FirebaseAuth.instance.currentUser?.uid;
    final allItems = ref.watch(allProductsProvider(userId));
    return allItems.when(
      data: (data) {
        return ListView(
          padding: const EdgeInsets.fromLTRB(16, 22, 16, 16),
          children: [
            if (data.isEmpty)
              const Center(
                child: AppText.paragraphI16(
                  'No Products Found',
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              )
            else
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
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
                        imageUrl: product["image"] ?? '',
                      ),
                    ),
                    title: AppText.paragraphI16(
                      product['name'] ?? 'Product Name',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                    subTitle: AppText.paragraphI14(
                      "Exp Date: ${product['expDate'] ?? '10/06/2023'}",
                      fontWeight: FontWeight.w400,
                      color: ConfigColors.slateGray,
                    ),
                    trailing: CommonCheckBox(
                      onChange: (checked) {
                        setState(() {
                          if (checked!) {
                            checkedProducts.add(product);
                          } else {
                            checkedProducts.remove(product);
                          }
                        });
                      },
                    ),
                  );
                },
              ),
            gapH26,
            // Center(
            //   child: CommonCard(
            //     height: 33,
            //     width: 132,
            //     borderColor: const Color(0xFF4794F9),
            //     onTap: () {},
            //     customRadius: BorderRadius.circular(6),
            //     padding:
            //         const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
            //     backgroundColor: ConfigColors.backgroundGreen,
            //     showBorder: true,
            //     alignment: Alignment.center,
            //     child: const AppText.paragraphI12(
            //       "Download List",
            //       fontWeight: FontWeight.w600,
            //       color: Color(0xFF4794F9),
            //     ),
            //   ),
            // ),
            //  gapH26,
            // Row(
            //   children: [
            //     Expanded(
            //       child: CommonButton(
            //         onPress: () {},
            //         prefixIcon: true,
            //         prefixIconData: Icons.search,
            //         text: "Search",
            //       ),
            //     ),
            //     gapW20,
            Expanded(
              child: CommonButton(
                onPress: () {
                  // if (checkedProducts.isNotEmpty) {
                  //   updateQuantitiesForCheckedProducts(checkedProducts);
                  // } else {
                  //   print('Select product first');
                  // }
                  Navigator.push(context, CompareScreen.route(checkedProducts));
                },
                text: "Compare",
              ),
            ),
            //   ],
            // ),
          ],
        );
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
