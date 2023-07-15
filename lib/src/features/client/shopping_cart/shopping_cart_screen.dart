import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/common_widgets/common_counter.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/features/client/shopping_cart/shopping_cart_provider.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class ShoppingCartScreen extends ConsumerWidget {
  static Route<ShoppingCartScreen> route() {
    return MaterialPageRoute(builder: (context) => const ShoppingCartScreen());
  }

  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.paragraphS16(
                  "Total Items (${data.length})",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                gapH16,
                Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
              ],
            ),
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
      ),

      // body: ListView(
      //   padding: const EdgeInsets.fromLTRB(16, 24, 16, 30),
      //   children: [
      //     const AppText.paragraphS16(
      //       "Total Items (03)",
      //       fontSize: 18,
      //       fontWeight: FontWeight.w600,
      //     ),
      //     gapH24,
      //     CommonCard(
      //       height: 91,
      //       width: 343,
      //       padding: const EdgeInsets.all(10),
      //       customRadius: BorderRadius.circular(16),
      //       child: Row(
      //         children: [
      //           CommonCard(
      //             height: 71,
      //             width: 76,
      //             padding: const EdgeInsets.all(10),
      //             backgroundColor: const Color(0xFFf2f2f2),
      //             child: Assets.oilBottle.image(),
      //           ),
      //           gapW16,
      //           Expanded(
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 const AppText.paragraphS16(
      //                   "Product Name",
      //                   fontSize: 18,
      //                   fontWeight: FontWeight.w600,
      //                 ),
      //                 gapH4,
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     const AppText.paragraphS16(
      //                       "\$234",
      //                       fontWeight: FontWeight.w600,
      //                       color: ConfigColors.primary2,
      //                     ),
      //                     CommonCounter(
      //                       value: '00',
      //                       onMinus: () {},
      //                       onPlus: () {},
      //                     ),
      //                   ],
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     gapH16,
      //     CommonCard(
      //       height: 91,
      //       width: 343,
      //       padding: const EdgeInsets.all(10),
      //       customRadius: BorderRadius.circular(16),
      //       child: Row(
      //         children: [
      //           CommonCard(
      //             height: 71,
      //             width: 76,
      //             padding: const EdgeInsets.all(10),
      //             backgroundColor: const Color(0xFFf2f2f2),
      //             child: Assets.banana.image(),
      //           ),
      //           gapW16,
      //           Expanded(
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 const AppText.paragraphS16(
      //                   "Product Name",
      //                   fontSize: 18,
      //                   fontWeight: FontWeight.w600,
      //                 ),
      //                 gapH4,
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     const AppText.paragraphS16(
      //                       "\$234",
      //                       fontWeight: FontWeight.w600,
      //                       color: ConfigColors.primary2,
      //                     ),
      //                     CommonCounter(
      //                       value: '00',
      //                       onMinus: () {},
      //                       onPlus: () {},
      //                     ),
      //                   ],
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     gapH16,
      //     CommonCard(
      //       height: 91,
      //       width: 343,
      //       padding: const EdgeInsets.all(10),
      //       customRadius: BorderRadius.circular(16),
      //       child: Row(
      //         children: [
      //           CommonCard(
      //             height: 71,
      //             width: 76,
      //             padding: const EdgeInsets.all(10),
      //             backgroundColor: const Color(0xFFf2f2f2),
      //             child: Assets.nescafeCoffee.image(),
      //           ),
      //           gapW16,
      //           Expanded(
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 const AppText.paragraphS16(
      //                   "Product Name",
      //                   fontSize: 18,
      //                   fontWeight: FontWeight.w600,
      //                 ),
      //                 gapH4,
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     const AppText.paragraphS16(
      //                       "\$234",
      //                       fontWeight: FontWeight.w600,
      //                       color: ConfigColors.primary2,
      //                     ),
      //                     CommonCounter(
      //                       value: '00',
      //                       onMinus: () {},
      //                       onPlus: () {},
      //                     ),
      //                   ],
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     gapH96,
      //     const CommonDottedBorderCard(
      //       backgroundColor: ConfigColors.backgroundGreen,
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           AppText.paragraphI16(
      //             "Subtotal ",
      //             fontWeight: FontWeight.w600,
      //             fontSize: 18,
      //           ),
      //           AppText.paragraphI16(
      //             "\$702 ",
      //             fontWeight: FontWeight.w600,
      //             color: ConfigColors.primary2,
      //             fontSize: 18,
      //           ),
      //         ],
      //       ),
      //     ),
      //     gapH28,
      //     CommonButton(
      //       onPress: () {
      //         Navigator.push(context, CheckOutScreen.route());
      //       },
      //       text: "Go to Checkout",
      //     ),
      //   ],
      // ),
    );
  }
}
