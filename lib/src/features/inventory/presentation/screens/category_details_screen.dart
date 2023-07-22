// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/common_widgets/common_app_bar.dart';
import 'package:inversaapp/src/common_widgets/common_scaffold.dart';
import 'package:inversaapp/src/features/inventory/presentation/provider/category_products_provider.dart';
import 'package:inversaapp/src/theme/config_colors.dart';

// TODO (abubakar) : show products

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
        body: const Center(
          child: Text("Under construction"),
        ),
      ),
    );
  }
}
