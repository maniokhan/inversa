import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/common_widgets/common_category_card.dart';
import 'package:inversaapp/src/extensions/try_parse_to_int.dart';
import 'package:inversaapp/src/features/store/presentation/provider/all_category_provider.dart';
import 'package:inversaapp/src/features/store/presentation/screens/category_details_screen.dart';
// TODO (abubakar): catogory image

class CategoryTabView extends ConsumerStatefulWidget {
  const CategoryTabView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CategoryTabViewState();
}

class _CategoryTabViewState extends ConsumerState<CategoryTabView> {
  @override
  Widget build(BuildContext context) {
    final categoryProvider = ref.watch(allCategoryProvider);
    return categoryProvider.when(
      data: (data) {
        return GridView.count(
          padding: const EdgeInsets.fromLTRB(16, 22, 16, 24),
          shrinkWrap: true,
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 4 / 3.4,
          children: List.generate(
            data.length,
            (index) {
              final category = data.elementAt(index);
              return CommonCategoryCard(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryDetailsScreen(
                        categoryId: category["documentId"],
                      ),
                    ),
                  );
                },
                image: CachedNetworkImage(
                  imageUrl: category['image'],
                ),
                title: category["name"],
                cardBackgroundColor: Color(
                  category['color'].toString().tryParseToInt(),
                ),
              );
            },
          ),
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
    );
  }
}
