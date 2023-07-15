import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/features/orders/data/order_details_provider.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class OrderDetailsScreen extends ConsumerWidget {
  final String orderId;
  const OrderDetailsScreen({
    super.key,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context, ref) {
    final orderDetailsValue = ref.watch(orderDetailsProvider(orderId));
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
          "Order Details",
          color: ConfigColors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: orderDetailsValue.when(
        data: (data) {
          return ListView.separated(
            itemCount: data.length,
            separatorBuilder: (context, index) => gapH12,
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 30),
            itemBuilder: (context, index) {
              final item = data.elementAt(index);
              return CommonCard(
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
                            item["name"],
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          gapH4,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const AppText.paragraphS14(
                                "2 bottle's",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: ConfigColors.primary2,
                              ),
                              gapW64,
                              AppText.paragraphS16(
                                "\$${item["price"]}",
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
