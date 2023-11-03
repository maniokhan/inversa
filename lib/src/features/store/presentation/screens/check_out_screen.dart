import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/notification_services.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_app_bar.dart';
import 'package:inversaapp/src/common_widgets/common_button.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/common_widgets/common_dotted_border_card.dart';
import 'package:inversaapp/src/common_widgets/common_list_tile.dart';
import 'package:inversaapp/src/common_widgets/common_scaffold.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/features/store/presentation/provider/order_notifier_provider.dart';
import 'package:inversaapp/src/features/store/presentation/screens/confirm_order_placed_screen.dart';
import 'package:inversaapp/src/helpers/loading_screen.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

enum PaymentMethod { card, cash }

class CheckOutScreen extends ConsumerStatefulWidget {
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
  ConsumerState<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends ConsumerState<CheckOutScreen> {
  PaymentMethod _method = PaymentMethod.card;
  @override
  Widget build(BuildContext context) {
    ref.listen(ordersNotifierProvider, (previous, next) {
      if (!next) {
        Navigator.push(context, ConfirmOrderPlaceScreen.route());
      }
    });
    final userId = FirebaseAuth.instance.currentUser?.uid;
    void updateProductQuantities(Iterable<Map<String, dynamic>> productList) {
      // Initialize a batch
      WriteBatch batch = FirebaseFirestore.instance.batch();

      // Iterate through your list of products and update Firestore documents
      for (var product in productList) {
        int buyQuantity = product['buyQuantity'];
        String productId = product['product_id'];

        // Reference to the Firestore document
        DocumentReference productRef =
            FirebaseFirestore.instance.collection('store_stock').doc(productId);

        // Update the "quantity" field by subtracting "buyQuantity"
        batch.update(
            productRef, {'quantity': FieldValue.increment(-buyQuantity)});
      }

      // Commit the batched write
      batch.commit().then((_) {
        // Batched write was successful
        print('Quantity updates completed');
      }).catchError((error) {
        // Handle any errors that occur during the batched write
        print('Error updating quantities: $error');
      });
    }

    Future<void> sendOrderNotification(String storeID) async {
      try {
        CollectionReference userAccountsCollection =
            FirebaseFirestore.instance.collection('user_accounts');

        QuerySnapshot querySnapshot = await userAccountsCollection
            .where('user_id', isEqualTo: storeID)
            .get();
        if (querySnapshot.docs.isNotEmpty) {
          final QueryDocumentSnapshot document = querySnapshot.docs.first;
          final Map<String, dynamic> data =
              document.data() as Map<String, dynamic>;
          print("device_token ${data['device_token'].toString()}");
          NotificationService.sendNotification('New order placed!',
              'A new order has been placed', data['device_token'].toString());
        }
      } catch (e) {
        print('Error fetching document: $e');
      }
    }

    return CommonScaffold(
      isScaffold: true,
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
            trailing: Transform.scale(
              scale: 1.2,
              child: Radio(
                activeColor: ConfigColors.primary,
                value: PaymentMethod.card,
                groupValue: _method,
                onChanged: (value) {
                  setState(() {
                    _method = value!;
                  });
                },
              ),
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
            trailing: Transform.scale(
              scale: 1.2,
              child: Radio(
                activeColor: ConfigColors.primary,
                value: PaymentMethod.cash,
                groupValue: _method,
                onChanged: (value) {
                  setState(() {
                    _method = value!;
                  });
                },
              ),
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
                "Total Item(0${widget.totalItem})",
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
                      "Price (${widget.totalItem} Items)",
                      fontWeight: FontWeight.w500,
                    ),
                    AppText.paragraphI16(
                      "\$${widget.subTotal} ",
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
                  "\$${widget.subTotal} ",
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
                "quantity": widget.totalItem,
                "store_id": widget.products.first['user_id'].toString(),
                "user_id": userId,
                "subtotal": widget.subTotal,
                "total": widget.subTotal,
              };
              updateProductQuantities(widget.products);
              try {
                LoadingScreen().show(context: context, text: "Please wait..");
                await ref.read(ordersNotifierProvider.notifier).createOrder(
                      data: order,
                      products: widget.products,
                    );
                await sendOrderNotification(
                    widget.products.first['user_id'].toString());
                // await ref
                //     .read(shoppingCartNotifierProvider.notifier)
                //     .deleteShoppingCart();
              } catch (e) {
                throw Exception('something went wrong while checkout');
              } finally {
                LoadingScreen().hide();
              }
            },
            text: "Order Placed",
          ),
        ],
      ),
    );
  }
}
