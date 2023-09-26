import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_app_bar.dart';
import 'package:inversaapp/src/common_widgets/common_list_tile.dart';
import 'package:inversaapp/src/common_widgets/common_scaffold.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/features/store/presentation/screens/order_placement_screen.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class AllStoresScreen extends StatelessWidget {
  static Route<AllStoresScreen> route() {
    return MaterialPageRoute(builder: (context) => const AllStoresScreen());
  }

  const AllStoresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final stores = ref.watch(allStoresProvider);
    final productsRef = FirebaseFirestore.instance
        .collection('user_accounts')
        .where("role", isEqualTo: "store")
        .snapshots();
    return CommonScaffold(
        isScaffold: true,
        appBar: CommonAppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: ConfigColors.white,
            ),
          ),
          title: 'All Stores',
          showleading: true,
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: productsRef,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  itemCount: snapshot.data!.docs.length,
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                  separatorBuilder: (context, index) => gapH16,
                  itemBuilder: (context, index) {
                    final store = snapshot.data!.docs[index];
                    return CommonListTile(
                      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                      onTap: () => Navigator.push(context,
                          OrderPlacementScreen.route(store["user_id"])),
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
                  child: CircularProgressIndicator(),
                );
              }
            }
            //  ListView.separated(
            //   itemCount: snapshot.data!.docs.length,
            //   padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
            //   separatorBuilder: (context, index) => gapH16,
            //   itemBuilder: (context, index) {
            //     final store = snapshot.data.;
            //     return CommonListTile(
            //       padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
            //       // onTap: () => Navigator.push(
            //       //     context, OrderPlacementScreen.route(store["user_id"])),
            //       onTap: () {
            //         // ref.read(searchNotifierProvider.notifier).deleteSearch();
            //         // Navigator.push(
            //         //     context, OrderPlacementScreen.route(store["user_id"]));
            //       },
            //       leading: SizedBox(
            //         height: 71,
            //         width: 76,
            //         child: Image.asset("assets/images/store_1.png"),
            //       ),
            //       gap: 18,
            //       title: AppText.paragraphI16(
            //         store["name"],
            //         fontSize: 15,
            //         maxLines: 2,
            //         fontWeight: FontWeight.w600,
            //       ),
            //       titleGap: 6,
            //       subTitle: const Row(
            //         children: [
            //           Icon(
            //             Icons.location_on_rounded,
            //             color: ConfigColors.primary2,
            //           ),
            //           gapW12,
            //           AppText.paragraphI14(
            //             "10 - 20 Min",
            //           ),
            //         ],
            //       ),
            //       trailing: Assets.outlinedForwardArrow.svg(),
            //     );
            //   },
            // ),
            ));
  }
}
