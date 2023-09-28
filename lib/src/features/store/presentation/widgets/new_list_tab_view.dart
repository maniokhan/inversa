import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:inversaapp/src/common_widgets/common_button.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/common_widgets/common_counter.dart';
import 'package:inversaapp/src/common_widgets/common_list_tile.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

class NewListTabView extends StatefulWidget {
  const NewListTabView({
    super.key,
    required this.products,
  });
  final List<Map<String, dynamic>> products;

  @override
  State<NewListTabView> createState() => _NewListTabViewState();
}

class _NewListTabViewState extends State<NewListTabView> {
  // List<Map<String, dynamic>> products = [];

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> updateQuantity(String productId, int newQuantity) async {
    try {
      await firestore.collection('products').doc(productId).update({
        'quantity': newQuantity,
      });
      print('Product quantity updated successfully.');
    } on FirebaseException catch (e) {
      print('Error updating product quantity: $e');
    }
  }

  Future<void> updateProductsQuantity(
      List<Map<String, dynamic>> checkedProducts) async {
    for (var product in checkedProducts) {
      String productId = product['product_id'];
      int newQuantity = product['quantity'];
      await updateQuantity(productId, newQuantity);
    }
    Navigator.pop(context);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // final products = ref.watch(newListProvider);
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 30),
      children: [
        if (widget.products.isEmpty)
          const Center(
            child: AppText.paragraphI16(
              'No New Products',
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          )
        else
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.products.length,
            itemBuilder: (context, index) {
              // widget.products[index]['quantity'] = 1;
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
                    child: Image.network(widget.products[index]['image'] ?? ''),
                  ),
                  title: AppText.paragraphI16(
                    widget.products[index]['name'] ?? 'Product Name',
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                  subTitle: AppText.paragraphI12(
                    "Exp Date: ${widget.products[index]['expDate'] ?? '10/06/2023'}",
                    fontWeight: FontWeight.w400,
                    color: ConfigColors.slateGray,
                  ),
                  trailing: CommonCounter(
                    value: widget.products[index]['quantity'].toString(),
                    onMinus: () {
                      if (widget.products[index]['quantity'] > 1) {
                        setState(() {
                          widget.products[index]['quantity']--;
                          // Decrease the quantity.
                          // widget.products[index]['quantity'] =
                          //     quantity; // Update the quantity in the data source.
                        });
                      }
                    },
                    onPlus: () {
                      setState(() {
                        widget.products[index]
                            ['quantity']++; // Decrease the quantity.
                        // Increase the quantity.
                        // widget.products[index]['quantity'] =
                        //     quantity; // Update the quantity in the data source.
                      });
                    },
                  ),
                ),
              );
            },
          ),
        gapH24,
        // Row(
        //   children: [
        //     Expanded(
        //       child: CommonButton(
        //         onPress: () {},
        //         text: "Download",
        //       ),
        //     ),
        gapW20,
        Expanded(
          child: CommonButton(
            onPress: () {
              updateProductsQuantity(widget.products);
            },
            text: "Accept",
          ),
        ),
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
  }
}


// CommonListTile(
        //   padding: const EdgeInsets.all(10),
        //   leading: CommonCard(
        //     height: 71,
        //     width: 76,
        //     padding: const EdgeInsets.all(10),
        //     backgroundColor: const Color(0xFFf2f2f2),
        //     child: Assets.oilBottle.image(),
        //   ),
        //   title: const AppText.paragraphI16(
        //     "Product Name",
        //     fontWeight: FontWeight.w600,
        //     fontSize: 18,
        //   ),
        //   subTitle: const AppText.paragraphI14(
        //     "Exp Date: 10/06/2023",
        //     fontWeight: FontWeight.w400,
        //     color: ConfigColors.slateGray,
        //   ),
        //   trailing: const AppText.paragraphI16(
        //     "\$234",
        //     fontWeight: FontWeight.w600,
        //     color: ConfigColors.primary2,
        //   ),
        // ),
        // gapH16,
        // CommonListTile(
        //   padding: const EdgeInsets.all(10),
        //   leading: CommonCard(
        //     height: 71,
        //     width: 76,
        //     padding: const EdgeInsets.all(10),
        //     backgroundColor: const Color(0xFFf2f2f2),
        //     child: Assets.banana.image(),
        //   ),
        //   title: const AppText.paragraphI16(
        //     "Product Name",
        //     fontWeight: FontWeight.w600,
        //     fontSize: 18,
        //   ),
        //   subTitle: const AppText.paragraphI14(
        //     "Exp Date: 10/06/2023",
        //     fontWeight: FontWeight.w400,
        //     color: ConfigColors.slateGray,
        //   ),
        //   trailing: const AppText.paragraphI16(
        //     "\$234",
        //     fontWeight: FontWeight.w600,
        //     color: ConfigColors.primary2,
        //   ),
        // ),
        // gapH16,
        // CommonListTile(
        //   padding: const EdgeInsets.all(10),
        //   leading: CommonCard(
        //     height: 71,
        //     width: 76,
        //     padding: const EdgeInsets.all(10),
        //     backgroundColor: const Color(0xFFf2f2f2),
        //     child: Assets.nescafeCoffee.image(),
        //   ),
        //   title: const AppText.paragraphI16(
        //     "Product Name",
        //     fontWeight: FontWeight.w600,
        //     fontSize: 18,
        //   ),
        //   subTitle: const AppText.paragraphI14(
        //     "Exp Date: 10/06/2023",
        //     fontWeight: FontWeight.w400,
        //     color: ConfigColors.slateGray,
        //   ),
        //   trailing: const AppText.paragraphI16(
        //     "\$234",
        //     fontWeight: FontWeight.w600,
        //     color: ConfigColors.primary2,
        //   ),
        // ),