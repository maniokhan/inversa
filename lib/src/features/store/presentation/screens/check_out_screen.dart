import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_app_bar.dart';
import 'package:inversaapp/src/common_widgets/common_button.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/common_widgets/common_dotted_border_card.dart';
import 'package:inversaapp/src/common_widgets/common_list_tile.dart';
import 'package:inversaapp/src/common_widgets/common_radio_button.dart';
import 'package:inversaapp/src/common_widgets/common_scaffold.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/features/store/presentation/provider/order_notifier_provider.dart';
import 'package:inversaapp/src/features/store/presentation/provider/shopping_cart_notifier_provider.dart';
import 'package:inversaapp/src/features/store/presentation/screens/confirm_order_placed_screen.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class CheckOutScreen extends ConsumerWidget {
  final double subTotal;
  final int totalItem;
  final Iterable<Map<String, dynamic>> products;

  const CheckOutScreen({
    Key? key,
    required this.products,
    required this.subTotal,
    required this.totalItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    ref.listen(ordersNotifierProvider, (previous, next) {
      if (!next) {
        Navigator.push(context, ConfirmOrderPlaceScreen.route());
      }
    });
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
          title: 'Check Out',
        ),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
          children: [
            CommonCard(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              height: 44,
              width: 343,
              showBorder: true,
              customRadius: BorderRadius.circular(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppText.paragraphI14(
                    "Deliver to",
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                  InkWell(
                    onTap: () {},
                    child: const AppText.paragraphI16(
                      "Select Store",
                      fontWeight: FontWeight.w500,
                      color: ConfigColors.primary2,
                      textDecoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            gapH24,
            const AppText.paragraphI14(
              "Select payment method ",
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
            gapH16,
            CommonListTile(
              onTap: () {},
              leading: CommonCard(
                height: 44,
                width: 44,
                customRadius: BorderRadius.circular(10),
                showShadow: false,
                backgroundColor: const Color.fromRGBO(195, 121, 255, 0.1),
                padding: const EdgeInsets.all(10),
                child: Assets.paymentcard.svg(),
              ),
              title: const AppText.paragraphI16(
                "Payment by card",
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              trailing: CommonRadioButton(
                value: false,
                groupValue: true,
                onChanged: (value) {},
              ),
            ),
            gapH16,
            CommonListTile(
              onTap: () {},
              leading: CommonCard(
                height: 44,
                width: 44,
                customRadius: BorderRadius.circular(10),
                showShadow: false,
                backgroundColor: ConfigColors.backgroundGreen,
                padding: const EdgeInsets.all(10),
                child: Assets.cash.image(),
              ),
              title: const AppText.paragraphI16(
                "Cash",
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              trailing: CommonRadioButton(
                value: true,
                groupValue: false,
                onChanged: (value) {},
              ),
            ),
            gapH24,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppText.paragraphI14(
                  "Price Details ",
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
                AppText.paragraphI14(
                  "Total Item(0$totalItem)",
                  fontWeight: FontWeight.w600,
                  color: ConfigColors.primary2,
                ),
              ],
            ),
            gapH12,
            CommonCard(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              height: 100,
              width: 343,
              showBorder: true,
              customRadius: BorderRadius.circular(8),
              backgroundColor: ConfigColors.backgroundGreen,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText.paragraphI16(
                        "Price ($totalItem Items)",
                        fontWeight: FontWeight.w500,
                      ),
                      AppText.paragraphI16(
                        "\$$subTotal ",
                        fontWeight: FontWeight.w600,
                        color: ConfigColors.primary2,
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText.paragraphI16(
                        "Delivery Charges",
                        fontWeight: FontWeight.w500,
                      ),
                      AppText.paragraphI16(
                        "Free",
                        fontWeight: FontWeight.w600,
                        color: ConfigColors.primary2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            gapH64,
            CommonDottedBorderCard(
              backgroundColor: ConfigColors.backgroundGreen,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppText.paragraphI16(
                    "Total Amount ",
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                  AppText.paragraphI16(
                    "\$$subTotal ",
                    fontWeight: FontWeight.w600,
                    color: ConfigColors.primary2,
                    fontSize: 18,
                  ),
                ],
              ),
            ),
            gapH26,
            CommonButton(
              onPress: () async {
                // FIXME (abubakar) : order document value
                final order = {
                  "created_at": FieldValue.serverTimestamp(),
                  "quantity": totalItem,
                  "store_id": products.first['user_id'].toString(),
                  "subtotal": subTotal,
                  "total": subTotal,
                };

                try {
                  await ref.read(ordersNotifierProvider.notifier).createOrder(
                        data: order,
                        products: products,
                      );

                  await ref
                      .read(shoppingCartNotifierProvider.notifier)
                      .deleteShoppingCart();
                } catch (e) {
                  throw Exception('something went wrong while checkout');
                }
              },
              text: "Order Placed",
            ),
          ],
        ),
      ),
    );
  }
}
