import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/common_widgets/common_app_bar.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/common_widgets/common_counter.dart';
import 'package:inversaapp/src/common_widgets/common_list_tile.dart';
import 'package:inversaapp/src/common_widgets/common_scaffold.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/features/store/presentation/provider/category_products_provider.dart';
import 'package:inversaapp/src/features/store/presentation/provider/product_notifier_provider.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class CategoryDetailsScreen extends ConsumerWidget {
  final String categoryId;
  const CategoryDetailsScreen({
    Key? key,
    required this.categoryId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final categoryProductProvider =
        ref.watch(categoryProductsProvider(categoryId));
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
          title: "Products",
        ),
        body: categoryProductProvider.when(
          data: (data) {
            return ListView.separated(
              itemCount: data.length,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              separatorBuilder: (context, index) => gapH16,
              itemBuilder: (context, index) {
                final product = data.elementAt(index);
                return CommonListTile(
                  padding: const EdgeInsets.all(10),
                  leading: CommonCard(
                    height: 71,
                    width: 76,
                    padding: const EdgeInsets.all(12),
                    backgroundColor: const Color(0xFFf2f2f2),
                    child: CachedNetworkImage(imageUrl: product['image']),
                  ),
                  title: AppText.paragraphI16(
                    product['name'],
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                  trailing: CommonCounter(
                    value: product['quantity'].toString(),
                    onMinus: () async {
                      if (product["quantity"] > 0) {
                        await ref
                            .read(productNotifierProvider.notifier)
                            .updateProduct(
                          documentId: product["documentId"],
                          data: {
                            "quantity": product["quantity"] - 1,
                          },
                        );
                      }
                    },
                    onPlus: () async {
                      await ref
                          .read(productNotifierProvider.notifier)
                          .updateProduct(
                        documentId: product["documentId"],
                        data: {
                          "quantity": product["quantity"] + 1,
                        },
                      );
                    },
                  ),
                );
              },
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
      ),
    );
  }
}
