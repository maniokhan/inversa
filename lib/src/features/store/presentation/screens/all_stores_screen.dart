import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_app_bar.dart';
import 'package:inversaapp/src/common_widgets/common_list_tile.dart';
import 'package:inversaapp/src/common_widgets/common_scaffold.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/features/store/presentation/provider/all_stores_provider.dart';
import 'package:inversaapp/src/features/store/presentation/provider/search_notifier_provider.dart';
import 'package:inversaapp/src/features/store/presentation/screens/order_placement_screen.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class AllStoresScreen extends ConsumerWidget {
  static Route<AllStoresScreen> route() {
    return MaterialPageRoute(builder: (context) => const AllStoresScreen());
  }

  const AllStoresScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final stores = ref.watch(allStoresProvider);
    return CommonScaffold(
      isScaffold: true,
      appBar: const CommonAppBar(
        title: 'All Stores',
      ),
      body: stores.when(
        data: (data) {
          if (data.isNotEmpty) {
            return ListView.separated(
              itemCount: data.length,
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
              separatorBuilder: (context, index) => gapH16,
              itemBuilder: (context, index) {
                final store = data.elementAt(index);
                return CommonListTile(
                  padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                  // onTap: () => Navigator.push(
                  //     context, OrderPlacementScreen.route(store["user_id"])),
                  onTap: () {
                    ref.read(searchNotifierProvider.notifier).deleteSearch();
                    Navigator.push(
                        context, OrderPlacementScreen.route(store["user_id"]));
                  },
                  leading: SizedBox(
                    height: 71,
                    width: 76,
                    child: Image.asset("assets/images/store_1.png"),
                  ),
                  gap: 18,
                  title: AppText.paragraphI16(
                    store["name"],
                    fontSize: 15,
                    maxLines: 2,
                    fontWeight: FontWeight.w600,
                  ),
                  titleGap: 6,
                  subTitle: const Row(
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        color: ConfigColors.primary2,
                      ),
                      gapW12,
                      AppText.paragraphI14(
                        "10 - 20 Min",
                      ),
                    ],
                  ),
                  trailing: Assets.outlinedForwardArrow.svg(),
                );
              },
            );
          } else {
            return const Center(
              child: AppText.paragraphI16("NO STORE AVAILABLE"),
            );
          }
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
