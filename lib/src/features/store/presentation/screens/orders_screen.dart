import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/features/store/presentation/provider/order_provider.dart';
import 'package:inversaapp/src/features/store/presentation/screens/order_details_screen.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class OrdersScreen extends ConsumerWidget {
  static Route<OrdersScreen> route() {
    return MaterialPageRoute(builder: (context) => const OrdersScreen());
  }

  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final ordersValue = ref.watch(orderProvider(false));
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
          "Orders",
          color: ConfigColors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: ordersValue.when(
        data: (data) {
          if (data.isNotEmpty) {
            return ListView.separated(
              itemCount: data.length,
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 30),
              separatorBuilder: (context, index) => gapH12,
              itemBuilder: (context, index) {
                final item = data.elementAt(index);
                final DateTime createdAt =
                    (item["created_at"] as Timestamp).toDate();
                return CommonCard(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderDetailsScreen(
                          orderId: item["order_id"],
                        ),
                      ),
                    );
                  },
                  padding: const EdgeInsets.all(16),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText.paragraphS16(
                              item["order_id"],
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            gapH4,
                            AppText.paragraphS14(
                              "Order Date: ${createdAt.toString().split(' ').first}",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            gapH4,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText.paragraphS14(
                                  "${item["quantity"]} item's",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: ConfigColors.primary2,
                                ),
                                gapW64,
                                AppText.paragraphS16(
                                  "\$${item["subtotal"]}",
                                  fontWeight: FontWeight.w600,
                                  color: ConfigColors.primary2,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return const Center(
            child: Text("Empty Order"),
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
      ),
    );
  }
}
