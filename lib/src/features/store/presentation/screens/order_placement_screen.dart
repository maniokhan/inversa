import 'package:badges/badges.dart' as badges;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_order_placement_card.dart';
import 'package:inversaapp/src/common_widgets/common_scaffold.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/features/store/presentation/provider/all_products_providers.dart';
import 'package:inversaapp/src/features/store/presentation/provider/search_notifier_provider.dart';
import 'package:inversaapp/src/features/store/presentation/provider/shopping_cart_total_item_provider.dart';
import 'package:inversaapp/src/features/store/presentation/screens/shopping_cart_screen.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class OrderPlacementScreen extends ConsumerStatefulWidget {
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
  ConsumerState<OrderPlacementScreen> createState() =>
      _OrderPlacementScreenState();
}

class _OrderPlacementScreenState extends ConsumerState<OrderPlacementScreen> {
  final ValueNotifier<int> shoppingCartTotalItems = ValueNotifier(0);

  late final TextEditingController _searchController;
  @override
  void initState() {
    ref.read(searchNotifierProvider.notifier).productSearch('');
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(allProductsProvider(widget.storeId));

    final shoppingCartTotalItemValue = ref.watch(shoppingCartTotalItemProvider);
    final productsRef = FirebaseFirestore.instance
        .collection('products')
        .where('user_id', isEqualTo: widget.storeId)
        .snapshots();
    return CommonScaffold(
      isScaffold: true,
      appBar: AppBar(
        toolbarHeight: 65,
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
            child: Stack(alignment: AlignmentDirectional.center, children: [
              badges.Badge(
                badgeStyle: const badges.BadgeStyle(
                  badgeColor: ConfigColors.primary2,
                ),
                badgeContent: shoppingCartTotalItemValue.when(
                  data: (data) {
                    return AppText.paragraphI12(
                      data.toString(),
                      color: ConfigColors.white,
                      fontWeight: FontWeight.w600,
                    );
                  },
                  error: (error, stackTrace) {
                    return const AppText.paragraphI12(
                      "0",
                      color: ConfigColors.white,
                      fontWeight: FontWeight.w600,
                    );
                  },
                  loading: () {
                    return const AppText.paragraphI12(
                      "0",
                      color: ConfigColors.white,
                      fontWeight: FontWeight.w600,
                    );
                  },
                ),
                child: Assets.basketWhite.svg(height: 24),
              ),
            ]),
          ),
          gapW16,
        ],
      ),
      body: StreamBuilder(
        stream: productsRef,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //   crossAxisCount: 2,
              //   mainAxisSpacing: 12,
              //   crossAxisSpacing: 12,
              //   childAspectRatio: 3 / 4,
              // ),
              itemBuilder: (context, index) {
                final document = snapshot.data!.docs[index];
                return CommonOrderPlacementCard(
                  product: document,
                );
              },
            );
          } else {
            return const Center(
                child: AppText.paragraphI16("No Products Available!"));
          }
        },
      ),
      // body: products.when(
      //   data: (data) {
      //     return Padding(
      //       padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
      //       child: Column(
      //         children: [
      //           CommonTextField(
      //             controller: _searchController,
      //             prefixIcon: Icons.search,
      //             hintText: 'Search',
      //             suffixIcon: Icons.close,
      //             onChanged: (value) {
      //               ref
      //                   .read(searchNotifierProvider.notifier)
      //                   .productSearch(value);
      //             },
      //             onSuffixIconPressed: () {
      //               ref.read(searchNotifierProvider.notifier).productSearch('');
      //               _searchController.clear();
      //             },
      //           ),
      //           gapH16,
      //           Expanded(
      //             child: data.isNotEmpty
      //                 ? GridView.builder(
      //                     itemCount: data.length,
      //                     gridDelegate:
      //                         const SliverGridDelegateWithFixedCrossAxisCount(
      //                       crossAxisCount: 2,
      //                       mainAxisSpacing: 12,
      //                       crossAxisSpacing: 12,
      //                       childAspectRatio: 3 / 4,
      //                     ),
      //                     itemBuilder: (context, index) {
      //                       final product = data.elementAt(index);
      //                       return CommonOrderPlacementCard(
      //                         product: product,
      //                       );
      //                     },
      //                   )
      //                 : const Center(
      //                     child:
      //                         AppText.paragraphI16("No Products Available!")),
      //           ),
      //         ],
      //       ),
      //     );
      //   },
      //   error: (error, stackTrace) {
      //     return const Center(
      //       child: Icon(Icons.error),
      //     );
      //   },
      //   loading: () {
      //     return const Center(
      //       child: CircularProgressIndicator(
      //         color: ConfigColors.primary,
      //       ),
      //     );
      //   },
      // ),
    );
  }

  @override
  void dispose() {
    shoppingCartTotalItems.dispose();
    _searchController.dispose();
    super.dispose();
  }
}
