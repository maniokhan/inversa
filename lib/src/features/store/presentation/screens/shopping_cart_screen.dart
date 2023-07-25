import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_button.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/common_widgets/common_counter.dart';
import 'package:inversaapp/src/common_widgets/common_dotted_border_card.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/features/store/presentation/provider/shopping_cart_provider.dart';
import 'package:inversaapp/src/features/store/presentation/screens/check_out_screen.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class ShoppingCartScreen extends ConsumerWidget {
  static Route<ShoppingCartScreen> route() {
    return MaterialPageRoute(builder: (context) => const ShoppingCartScreen());
  }

  const ShoppingCartScreen({super.key});

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
              subtotal += product["price"];
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
                                    child: Assets.oilBottle.image(),
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
                                          item['name'],
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        gapH4,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            AppText.paragraphS16(
                                              "\$${item['price']}",
                                              fontWeight: FontWeight.w600,
                                              color: ConfigColors.primary2,
                                            ),
                                            CommonCounter(
                                              value: '00',
                                              onMinus: () {},
                                              onPlus: () {},
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
