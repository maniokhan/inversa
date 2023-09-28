import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/common_widgets/common_button.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/common_widgets/common_dotted_border_card.dart';
import 'package:inversaapp/src/common_widgets/common_list_tile.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/features/store/presentation/screens/compare_screen.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class OldListTabView extends ConsumerWidget {
  const OldListTabView({
    super.key,
  });
  // final List<Map<String, dynamic>> products;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(oldListProvider);
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 30),
      children: [
        if (products.isEmpty)
          const Center(
            child: AppText.paragraphI16(
              'No Old Products',
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          )
        else
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  bottom: 16,
                ),
                child: CommonListTile(
                  padding: const EdgeInsets.all(10),
                  leading: CommonCard(
                    height: 71,
                    width: 76,
                    padding: const EdgeInsets.all(10),
                    backgroundColor: const Color(0xFFf2f2f2),
                    child: Image.network(products[index]['image'] ?? ''),
                  ),
                  title: AppText.paragraphI16(
                    products[index]['name'] ?? 'Product Name',
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                  subTitle: AppText.paragraphI12(
                    "Exp Date: ${products[index]['expDate'] ?? '10/06/2023'}",
                    fontWeight: FontWeight.w400,
                    color: ConfigColors.slateGray,
                  ),
                  trailing: AppText.paragraphI16(
                    "\$${products[index]['price'] ?? 'N/A'}",
                    fontWeight: FontWeight.w600,
                    color: ConfigColors.primary2,
                  ),
                ),
              );
            },
          ),
        // gapH24,
        // Row(
        //   children: [
        //     Expanded(
        //       child: CommonButton(
        //         onPress: () {},
        //         text: "Download",
        //       ),
        //     ),
        //     gapW20,
        //     Expanded(
        //       child: CommonButton(
        //         onPress: () {},
        //         text: "Accept",
        //       ),
        //     ),
        //   ],
        // ),
        // gapH24,
        // const AppText.paragraphS16(
        //   "Summary",
        //   fontSize: 18,
        //   fontWeight: FontWeight.w600,
        // ),
        // gapH16,
        // CommonDottedBorderCard(
        //   height: 119,
        //   width: 343,
        //   onTap: () {},
        //   borderColor: ConfigColors.primary2,
        //   backgroundColor: ConfigColors.backgroundGreen,
        //   padding: const EdgeInsets.all(16),
        //   customRadius: const Radius.circular(6),
        //   child: const AppText.paragraphI12(
        //     "Lorem ipsum dolor sit amet consectetur. Sit vehicula in enim volutpat est faucibus tempus erat nibh. Pretium velit eu velit tristique ac. Lectus posuere mi tempor ultricies bibendum ac eget.",
        //     fontWeight: FontWeight.w400,
        //   ),
        // ),
      ],
    );

    //  ListView(
    //   padding: const EdgeInsets.fromLTRB(16, 24, 16, 30),
    //   children: [
    //     CommonDottedBorderCard(
    //       borderColor: ConfigColors.lightText,
    //       strokeWidth: 0.5,
    //       onTap: () {},
    //       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
    //       customRadius: const Radius.circular(6),
    //       backgroundColor: ConfigColors.lightGreen,
    //       child: const Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               AppText.paragraphI14(
    //                 "Search",
    //                 fontWeight: FontWeight.w600,
    //                 fontSize: 15,
    //               ),
    //               Row(
    //                 children: [
    //                   AppText.paragraphI14(
    //                     "#7",
    //                     fontWeight: FontWeight.w500,
    //                     fontSize: 15,
    //                     color: ConfigColors.primary2,
    //                   ),
    //                   gapW24,
    //                   AppText.paragraphI14(
    //                     "\$25",
    //                     fontWeight: FontWeight.w500,
    //                     fontSize: 15,
    //                     color: ConfigColors.primary2,
    //                   ),
    //                 ],
    //               ),
    //             ],
    //           ),
    //           gapH24,
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               AppText.paragraphI14(
    //                 "Cake",
    //                 fontWeight: FontWeight.w600,
    //                 fontSize: 15,
    //               ),
    //               Row(
    //                 children: [
    //                   AppText.paragraphI14(
    //                     "#1",
    //                     fontWeight: FontWeight.w500,
    //                     fontSize: 15,
    //                     color: ConfigColors.primary2,
    //                   ),
    //                   gapW24,
    //                   AppText.paragraphI14(
    //                     "\$10",
    //                     fontWeight: FontWeight.w500,
    //                     fontSize: 15,
    //                     color: ConfigColors.primary2,
    //                   ),
    //                 ],
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //     gapH32,
    //     Row(
    //       children: [
    //         Expanded(
    //           child: CommonButton(
    //             onPress: () {},
    //             text: "Download",
    //           ),
    //         ),
    //         gapW20,
    //         Expanded(
    //           child: CommonButton(
    //             onPress: () {},
    //             text: "Accept",
    //           ),
    //         ),
    //       ],
    //     ),
    //     gapH24,
    //     const AppText.paragraphS16(
    //       "Summary",
    //       fontSize: 18,
    //       fontWeight: FontWeight.w600,
    //     ),
    //     gapH16,
    //     CommonDottedBorderCard(
    //       height: 119,
    //       width: 343,
    //       onTap: () {},
    //       borderColor: ConfigColors.primary2,
    //       backgroundColor: ConfigColors.backgroundGreen,
    //       padding: const EdgeInsets.all(16),
    //       customRadius: const Radius.circular(6),
    //       child: const AppText.paragraphI12(
    //         "Lorem ipsum dolor sit amet consectetur. Sit vehicula in enim volutpat est faucibus tempus erat nibh. Pretium velit eu velit tristique ac. Lectus posuere mi tempor ultricies bibendum ac eget.",
    //         fontWeight: FontWeight.w400,
    //       ),
    //     ),
    //   ],
//    );
  }
}
