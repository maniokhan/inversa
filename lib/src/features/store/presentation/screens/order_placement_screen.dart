// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_order_placement_card.dart';
import 'package:inversaapp/src/common_widgets/common_text_field.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/features/store/presentation/provider/all_products_providers.dart';
import 'package:inversaapp/src/features/store/presentation/screens/shopping_cart_screen.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class OrderPlacementScreen extends ConsumerWidget {
  final String storeId;
  static Route<OrderPlacementScreen> route(String id) {
    return MaterialPageRoute(
        builder: (context) => OrderPlacementScreen(storeId: id));
  }

  const OrderPlacementScreen({
    super.key,
    required this.storeId,
  });

  @override
  Widget build(BuildContext context, ref) {
    final products = ref.watch(allProductsProvider(storeId));

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
          "Order Placement",
          color: ConfigColors.white,
          fontWeight: FontWeight.w600,
        ),
        actions: [
          InkWell(
            onTap: () => Navigator.push(context, ShoppingCartScreen.route()),
            child: Assets.basketWhite.svg(height: 20),
          ),
          gapW16,
        ],
      ),
      body: products.when(
        data: (data) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
            child: Column(
              children: [
                const CommonTextField(
                  prefixIcon: Icons.search,
                  hintText: 'Search',
                  suffixIcon: Icons.close,
                ),
                gapH16,
                Expanded(
                  child: GridView.builder(
                    itemCount: data.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 3 / 4,
                    ),
                    itemBuilder: (context, index) {
                      final product = data.elementAt(index);
                      return CommonOrderPlacementCard(
                        image: Assets.eggNoodles.image(height: 80),
                        title: product['name'],
                        subtitle: product['quantity'].toString(),
                        price: product['price'],
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
            child: CircularProgressIndicator(
              color: ConfigColors.primary,
            ),
          );
        },
      ),
    );
  }
}
