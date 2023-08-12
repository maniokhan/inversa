import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_button.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/common_widgets/common_counter.dart';
import 'package:inversaapp/src/common_widgets/common_dotted_border_card.dart';
import 'package:inversaapp/src/common_widgets/common_list_tile.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/features/store/presentation/provider/all_products_providers.dart';
import 'package:inversaapp/src/features/store/presentation/screens/compare_screen.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class ScanTabView extends ConsumerWidget {
  const ScanTabView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final String? userId = FirebaseAuth.instance.currentUser?.uid;

    final allproduct = ref.watch(allProductsProvider(userId));
    return allproduct.when(
      data: (data) {
        return ListView(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 30),
          children: [
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: CommonDottedBorderCard(
                    height: 118,
                    width: 263,
                    borderColor: ConfigColors.lightText,
                    strokeWidth: 0.5,
                    onTap: () {},
                    customRadius: const Radius.circular(6),
                    alignment: Alignment.center,
                    backgroundColor: ConfigColors.backgroundGrey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonCard(
                          showShadow: false,
                          padding: const EdgeInsets.all(5),
                          backgroundColor: ConfigColors.lightGreen,
                          shape: BoxShape.circle,
                          child: Assets.scanCodeLightScreen.svg(),
                        ),
                        gapH12,
                        const AppText.paragraphI16(
                          "Scan code",
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: ConfigColors.slateGray,
                        ),
                      ],
                    ),
                  ),
                ),
                gapW16,
                Expanded(
                  child: CommonDottedBorderCard(
                    height: 118,
                    width: 66,
                    borderColor: ConfigColors.lightText,
                    strokeWidth: 0.5,
                    onTap: () {},
                    padding: const EdgeInsets.all(10),
                    customRadius: const Radius.circular(6),
                    alignment: Alignment.center,
                    backgroundColor: ConfigColors.backgroundGrey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Assets.plusWhitePng.image(
                          color: ConfigColors.primary2,
                          height: 12,
                        ),
                        gapH8,
                        const AppText.paragraphI16(
                          "Add",
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: ConfigColors.primary2,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            gapH24,
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
                  itemCount: data.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
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
                          imageUrl: product['image'] ?? '',
                        ),
                      ),
                      title: AppText.paragraphI16(
                        product['name'] ?? 'Product Name',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                      titleGap: 6,
                      subTitle: AppText.paragraphI12(
                        "Exp Date: ${product['expDate'] ?? '10/06/2023'}",
                        fontWeight: FontWeight.w500,
                        color: ConfigColors.slateGray,
                      ),
                      trailing: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppText.paragraphI16(
                            "\$${product['price'] ?? 'N/A'}",
                            fontWeight: FontWeight.w600,
                            color: ConfigColors.primary2,
                          ),
                          gapH4,
                          CommonCounter(
                            value: product['quantity'].toString(),
                            onMinus: () {},
                            onPlus: () {},
                          ),
                        ],
                      ),
                    );
                  }),
            gapH48,
            CommonButton(
              onPress: () {
                Navigator.push(context, CompareScreen.route());
              },
              text: "Compare",
            ),
          ],
        );
      },
      error: (error, stackTrace) {
        return const Center(
          child: Icon(Icons.error),
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
