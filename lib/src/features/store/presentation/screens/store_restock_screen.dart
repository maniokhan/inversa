// ignore_for_file: override_on_non_overriding_member

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/common_widgets/common_app_bar.dart';
import 'package:inversaapp/src/common_widgets/common_button.dart';
import 'package:inversaapp/src/common_widgets/common_card.dart';
import 'package:inversaapp/src/common_widgets/common_dotted_border_card.dart';
import 'package:inversaapp/src/common_widgets/common_scaffold.dart';
import 'package:inversaapp/src/common_widgets/common_text_field.dart';
import 'package:inversaapp/src/common_widgets/common_text_field_title.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/features/store/presentation/provider/all_products_providers.dart';
import 'package:inversaapp/src/features/store/presentation/widgets/common_search_delegate.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

final selectedProductProvider =
    StateProvider<Map<String, dynamic>>((ref) => {});

class StoreRestockScreen extends ConsumerStatefulWidget {
  static Route route() {
    return MaterialPageRoute(builder: (context) => const StoreRestockScreen());
  }

  const StoreRestockScreen({super.key});

  @override
  ConsumerState<StoreRestockScreen> createState() => _StoreRestockScreenState();
}

class _StoreRestockScreenState extends ConsumerState<StoreRestockScreen> {
  @override
  TextEditingController? productPriceController;
  TextEditingController? productQuantityController;
  TextEditingController? unitValueController;
  TextEditingController? unitNameController;
  TextEditingController? expDateController;

  @override
  void initState() {
    super.initState();
    productPriceController = TextEditingController();
    productQuantityController = TextEditingController();
    unitValueController = TextEditingController();
    unitNameController = TextEditingController();
    expDateController = TextEditingController();
  }

  void _handleProductSelection(Map<String, dynamic> product, WidgetRef ref) {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }

    final selectedProduct =
        ref.read(selectedProductProvider.notifier).update((state) => product);

    setState(() {
      // selectedProduct = product;

      productPriceController?.text = selectedProduct['price'] ?? '';
      productQuantityController?.text = selectedProduct['quantity'].toString();
      unitValueController?.text = selectedProduct['units']['value'];
      unitNameController?.text = selectedProduct['units']['name'];
      expDateController?.text = selectedProduct['expDate'];
    });
  }

  @override
  void dispose() {
    productPriceController?.dispose();
    productQuantityController?.dispose();
    unitValueController?.dispose();
    unitNameController?.dispose();
    expDateController?.dispose();
    super.dispose();
  }

  Future<void> updateProduct(Map<String, dynamic> selectedProduct) async {
    if (selectedProduct['product_id'] != null) {
      Map<String, dynamic> updatedData = {
        'price': productPriceController!.text,
        'quantity': int.parse(productQuantityController!.text),
        'expDate': expDateController!.text,
        'units': {
          'name': unitNameController!.text,
          'value': unitValueController!.text,
        },
      };
      await FirebaseFirestore.instance
          .collection('products')
          .doc(selectedProduct['product_id'])
          .update(updatedData);
      Map<String, dynamic> oldData = {
        'price': selectedProduct['price'],
        'quantity': selectedProduct['quantity'],
        'expDate': selectedProduct['expDate'],
        'units': {
          'name': selectedProduct['units']['name'],
          'value': selectedProduct['units']['value'],
        },
      };
      await FirebaseFirestore.instance
          .collection('products')
          .doc(selectedProduct['product_id'])
          .collection('history')
          .add(oldData)
          .then((value) => {
                print('Old Value Added'),
                setState(() {
                  Navigator.pop(context);
                }),
              });
    }
  }

  Future<void> scanBarcode() async {
    Map<String, dynamic>? scanProduct; // Use a nullable map

    try {
      scanResult = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.BARCODE,
      );
    } on PlatformException {
      scanResult = 'Failed to get Platform version.';
    }

    if (!mounted) return;

    if (scanResult != '-1') {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('products')
          .doc(scanResult)
          .get();

      if (snapshot.exists) {
        setState(() {
          scanProduct = snapshot.data() as Map<String, dynamic>;
        });

        if (scanProduct != null) {
          final selectedProduct = ref
              .read(selectedProductProvider.notifier)
              .update((state) => scanProduct!);
          setState(() {
            productPriceController?.text = selectedProduct['price'] ?? '';
            productQuantityController?.text =
                selectedProduct['quantity'].toString();
            unitValueController?.text = selectedProduct['units']['value'];
            unitNameController?.text = selectedProduct['units']['name'];
            expDateController?.text = selectedProduct['expDate'];
          });
        } else {
          // when scanProduct is null
          print('There is No product.');
        }
      } else {
        // when the document doesn't exist
        print('There is No product.');
      }
    } else {
      // when no barcode was scanned
      print('Wrong Barcode! Scan Again.');
    }
  }

  String? scanResult;
  @override
  Widget build(BuildContext context) {
    final String? userId = FirebaseAuth.instance.currentUser?.uid;
    final productsValue = ref.watch(allProductsProvider(userId));
    final selectedProduct = ref.watch(selectedProductProvider);
    return CommonScaffold(
      isScaffold: true,
      appBar: CommonAppBar(
        showleading: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: ConfigColors.white,
          ),
        ),
        title: "Restock",
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
        children: [
          CommonDottedBorderCard(
            borderColor: ConfigColors.blueGrey,
            strokeWidth: 0.5,
            onTap: () {
              scanBarcode();
            },
            padding: const EdgeInsets.all(32),
            customRadius: const Radius.circular(6),
            alignment: Alignment.center,
            backgroundColor: ConfigColors.backgroundGrey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonCard(
                  showShadow: false,
                  padding: const EdgeInsets.all(5),
                  backgroundColor: ConfigColors.lightGreen,
                  shape: BoxShape.circle,
                  child: Assets.scanCodeLightScreen.svg(),
                ),
                gapH12,
                const AppText.paragraphI16(
                  "Scan code",
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: ConfigColors.slateGray,
                ),
              ],
            ),
          ),
          gapH20,
          Row(
            children: [
              productsValue.when(
                data: (data) {
                  return CommonCard(
                    onTap: () async {
                      final product = await showSearch(
                        context: context,
                        delegate: CommonSearchDelegate(
                          searchTerms: data.toList(),
                          onChanged: (List<Map<String, dynamic>> items) {},
                        ),
                      );
                      _handleProductSelection(product, ref);
                    },
                    child: const AppText.paragraphS16('search'),
                  );
                },
                error: (error, stackTrace) {
                  return const Center(
                    child: AppText.paragraphI16('something went wrong'),
                  );
                },
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
          gapH12,
          if (selectedProduct['image'] != null)
            CommonCard(
              height: 91,
              width: 343,
              padding: const EdgeInsets.all(10),
              customRadius: BorderRadius.circular(16),
              child: Row(
                children: [
                  CommonCard(
                    height: 71,
                    width: 76,
                    padding: const EdgeInsets.all(10),
                    backgroundColor: const Color(0xFFf2f2f2),
                    child: CachedNetworkImage(
                      imageUrl: selectedProduct['image'],
                      placeholder: (context, url) => Container(
                        color: Colors.black12,
                      ),
                    ),
                  ),
                  gapW16,
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.paragraphS16(
                          selectedProduct['name'],
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        gapH4,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          gapH20,
          Row(
            children: [
              Expanded(
                child: CommonTextFieldTitle(
                  leading: Assets.priceTag.image(height: 22),
                  text: 'Price / Unit',
                ),
              ),
              gapW16,
              Expanded(
                child: CommonTextFieldTitle(
                  leading: Assets.priceTag.image(height: 22),
                  text: 'Quantity',
                ),
              ),
            ],
          ),
          gapH8,
          Row(
            children: [
              Expanded(
                child: CommonTextField(
                  textInputType: TextInputType.number,
                  hintText: 'Add Price',
                  controller: productPriceController,
                ),
              ),
              gapW16,
              Expanded(
                child: CommonTextField(
                  textInputType: TextInputType.number,
                  hintText: 'Add Quantity',
                  controller: productQuantityController,
                ),
              ),
            ],
          ),
          gapH20,
          Row(
            children: [
              Expanded(
                child: CommonTextFieldTitle(
                  leading: Assets.uninstall.image(height: 22),
                  text: 'Unit Value',
                ),
              ),
              gapW16,
              Expanded(
                child: CommonTextFieldTitle(
                  leading: Assets.uninstall.image(height: 22),
                  text: 'Unit Type',
                ),
              ),
            ],
          ),
          gapH8,
          Row(
            children: [
              Expanded(
                child: CommonTextField(
                  textInputType: TextInputType.number,
                  hintText: 'Add Unit Value',
                  controller: unitValueController,
                ),
              ),
              gapW16,
              Expanded(
                child: CommonTextField(
                  suffixIcon: Icons.keyboard_arrow_down_sharp,
                  textInputType: TextInputType.number,
                  hintText: 'Select Unit',
                  controller: unitNameController,
                ),
              ),
            ],
          ),
          gapH20,
          CommonTextFieldTitle(
            leading: Assets.calendar.image(height: 22),
            text: 'Expiration Date',
          ),
          gapH8,
          CommonTextField(
            textInputType: TextInputType.number,
            hintText: 'Add Expiration Date',
            controller: expDateController,
          ),
          gapH32,
          CommonButton(
            onPress: () {
              updateProduct(selectedProduct);
            },
            synappButtonColor: SynappButtonColor.primary,
            text: 'Save',
          ),
        ],
      ),
    );
  }
}
