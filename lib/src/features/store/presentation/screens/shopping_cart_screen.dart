import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/common_widgets/common_button.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/common_widgets/common_counter.dart';
import 'package:inversaapp/src/common_widgets/common_dotted_border_card.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/extensions/try_parse_to_int.dart';
import 'package:inversaapp/src/features/store/presentation/provider/shopping_cart_notifier_provider.dart';
import 'package:inversaapp/src/features/store/presentation/provider/shopping_cart_provider.dart';
import 'package:inversaapp/src/features/store/presentation/screens/check_out_screen.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class ShoppingCartScreen extends ConsumerWidget {
  static Route<ShoppingCartScreen> route() {
    return MaterialPageRoute(builder: (context) => const ShoppingCartScreen());
  }

  const ShoppingCartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double subtotal = 0;
    final shoopingCart = ref.watch(shoppingCartProvider);
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
          "My Cart",
          color: ConfigColors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: shoopingCart.when(
        data: (data) {
          if (data.isNotEmpty) {
            for (var product in data) {
              subtotal +=
                  product["total_price_quantity"].toString().tryParseToInt();
            }
            return Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        color: ConfigColors.slateGray,
                        fontSize: 18,
                      ),
                      text: 'Total Items ',
                      children: [
                        TextSpan(
                          style: const TextStyle(
                            fontSize: 18,
                            color: ConfigColors.primary2,
                          ),
                          text: '(0${data.length})',
                        ),
                      ],
                    ),
                  ),
                  gapH24,
                  Expanded(
                    child: ListView.separated(
                      itemCount: data.length,
                      separatorBuilder: (context, index) => gapH16,
                      itemBuilder: (context, index) {
                        final item = data.elementAt(index);
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonCard(
                              height: 91,
                              width: 343,
                              padding: const EdgeInsets.all(10),
                              customRadius: BorderRadius.circular(16),
                              child: Row(
                                children: [
                                  CommonCard(
                                    height: 71,
                                    width: 76,
                                    padding: const EdgeInsets.all(10),
                                    backgroundColor: const Color(0xFFf2f2f2),
                                    child: CachedNetworkImage(
                                      imageUrl: item['image'],
                                      placeholder: (context, url) => Container(
                                        color: Colors.black12,
                                      ),
                                    ),
                                  ),
                                  gapW16,
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppText.paragraphS16(
                                          item['title'],
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        gapH4,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            AppText.paragraphS16(
                                              "\$${item['total_price_quantity']}",
                                              fontWeight: FontWeight.w600,
                                              color: ConfigColors.primary2,
                                            ),
                                            CommonCounter(
                                              value:
                                                  item["quantity"].toString(),
                                              onMinus: () async {
                                                if (item["quantity"] > 1) {
                                                  await ref
                                                      .read(
                                                          shoppingCartNotifierProvider
                                                              .notifier)
                                                      .updateShoppingCart(
                                                    documentId:
                                                        item["documentId"],
                                                    data: {
                                                      'quantity':
                                                          item['quantity'] - 1,
                                                      'total_price_quantity': item[
                                                                  'price']
                                                              .toString()
                                                              .tryParseToInt() *
                                                          (item['quantity'] -
                                                              1),
                                                    },
                                                  );
                                                } else {
                                                  await ref
                                                      .read(
                                                          shoppingCartNotifierProvider
                                                              .notifier)
                                                      .deleteProductShoppingCart(
                                                          item["documentId"]);
                                                }
                                              },
                                              onPlus: () async {
                                                await ref
                                                    .read(
                                                        shoppingCartNotifierProvider
                                                            .notifier)
                                                    .updateShoppingCart(
                                                  documentId:
                                                      item["documentId"],
                                                  data: {
                                                    'quantity':
                                                        item['quantity'] + 1,
                                                    'total_price_quantity': item[
                                                                'price']
                                                            .toString()
                                                            .tryParseToInt() *
                                                        (item['quantity'] + 1),
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  gapH32,
                  CommonDottedBorderCard(
                    backgroundColor: ConfigColors.backgroundGreen,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const AppText.paragraphI16(
                          "Subtotal ",
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                        AppText.paragraphI16(
                          "\$$subtotal ",
                          fontWeight: FontWeight.w600,
                          color: ConfigColors.primary2,
                          fontSize: 18,
                        ),
                      ],
                    ),
                  ),
                  gapH28,
                  CommonButton(
                    onPress: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return CheckOutScreen(
                            products: data,
                            subTotal: subtotal,
                            totalItem: data.length,
                          );
                        },
                      ));
                    },
                    text: "Go to Checkout",
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: AppText.paragraphI16("Empty Shopping cart"),
            );
          }
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
      ),
    );
  }
}
