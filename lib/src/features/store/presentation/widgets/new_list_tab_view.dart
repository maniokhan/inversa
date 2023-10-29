import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inversaapp/src/common_widgets/common_button.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/common_widgets/common_counter.dart';
import 'package:inversaapp/src/common_widgets/common_list_tile.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/helpers/loading_screen.dart';
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
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Map<String, int> initialQuantities = {};
  Future<void> updateQuantity(String productId, int productLeft,
      String storeProductId, Map<String, dynamic> storeProductData) async {
    try {
      DocumentReference documentReference =
          firestore.collection('store_stock').doc(storeProductId);

// Check if the document exists
      documentReference.get().then((documentSnapshot) {
        if (documentSnapshot.exists) {
          Map<String, dynamic> productData =
              documentSnapshot.data() as Map<String, dynamic>;
          int currentQuantity = productData['quantity'] as int;
          num newQuantity =
              currentQuantity.toInt() + storeProductData['quantity'];

          // Update only the quantity field
          documentReference.update({'quantity': newQuantity}).then((value) {
            print('Quantity updated successfully');
          }).catchError((error) {
            print('Error updating quantity: $error');
          });
        } else {
          // Document doesn't exist, set a new document
          documentReference.set(storeProductData).then((value) {
            print('New document created successfully');
          }).catchError((error) {
            print('Error creating new document: $error');
          });
        }
      });
      // await firestore
      //     .collection('store_stock')
      //     .doc(storeProductId)
      //     .set(storeProductData);

      await firestore.collection('products').doc(productId).update({
        'quantity': productLeft,
      });
      print('Product quantity updated successfully.');
    } on FirebaseException catch (e) {
      print('Error updating product quantity: $e');
      LoadingScreen().hide();
    }
  }

  Future<void> updateProductsQuantity(
      List<Map<String, dynamic>> checkedProducts) async {
    LoadingScreen().show(context: context, text: 'please wait');
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return;
    }

    for (var product in checkedProducts) {
      final List<String> ids = <String>[currentUser.uid, product['product_id']];
      ids.sort();
      final String stockProductId = ids.join('_');
      int newQuantityStockProduct = product['quantity'];
      String productId = product['product_id'];
      num productLeft =
          initialQuantities[product['product_id']]! - product['quantity'];
      final Map<String, dynamic> stockProductDetails = product;
      stockProductDetails['product_id'] = stockProductId;
      stockProductDetails['user_id'] = currentUser.uid;

      await updateQuantity(
          productId, productLeft.toInt(), stockProductId, stockProductDetails);
    }
    LoadingScreen().hide();
    Navigator.pop(context);
    Navigator.pop(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var product in widget.products) {
      initialQuantities[product['product_id']] = product['quantity'];
    }
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
              final maxQuantity =
                  initialQuantities[widget.products[index]['product_id']];
              print(maxQuantity);
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
                      if (widget.products[index]['quantity'] < maxQuantity) {
                        setState(() {
                          widget.products[index]
                              ['quantity']++; // Decrease the quantity.
                          // Increase the quantity.
                          // widget.products[index]['quantity'] =
                          //     quantity; // Update the quantity in the data source.
                        });
                      } else {
                        showCupertinoDialog(maxQuantity);
                      }
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

  void showCupertinoDialog(availableStock) async {
    await showDialog(
      context: context,
      builder: ((context) {
        return CupertinoAlertDialog(
          title: const AppText.paragraphI16(
            "Out of Stock",
            fontWeight: FontWeight.w600,
          ),
          content: AppText.paragraphI14(
            "Sorry, we have only $availableStock units in stock.",
            color: ConfigColors.slateGray,
          ),
          actions: [
            CupertinoDialogAction(
              child: const AppText.paragraphI16(
                "OK",
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
            ),
          ],
        );
      }),
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