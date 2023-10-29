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
import 'package:inversaapp/src/common_widgets/common_counter.dart';
import 'package:inversaapp/src/common_widgets/common_dotted_border_card.dart';
import 'package:inversaapp/src/common_widgets/common_list_tile.dart';
import 'package:inversaapp/src/common_widgets/common_scaffold.dart';
import 'package:inversaapp/src/constants/app_sizes.dart';
import 'package:inversaapp/src/features/store/presentation/provider/all_products_providers.dart';
import 'package:inversaapp/src/features/store/presentation/provider/order_notifier_provider.dart';
import 'package:inversaapp/src/features/store/presentation/widgets/common_search_delegate.dart';
import 'package:inversaapp/src/theme/config_colors.dart';
import 'package:inversaapp/src/theme/text.dart';

enum PaymentMethod { card, cash }

class SaleScreen extends ConsumerStatefulWidget {
  static Route<SaleScreen> route() {
    return MaterialPageRoute(builder: (context) => const SaleScreen());
  }

  const SaleScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SaleScreenState();
}

class _SaleScreenState extends ConsumerState<SaleScreen> {
  double counterSaleSubTotal = 0;
  final List<Map<String, dynamic>> products = [];
  PaymentMethod _method = PaymentMethod.card;

  Future<void> scanBarcode() async {
    String scanResult;
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
          scanProduct!["counter_sale_quantity"] = 1;
          scanProduct!["isShoppingCart"] = false;
        });

        if (scanProduct != null) {
          setState(() {
            products.add(scanProduct!);
            print(scanProduct.toString());
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

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    final productsValue = ref.watch(allStoreStockProductsProvider(userId));
    counterSaleSubTotal = 0;
    for (var item in products) {
      counterSaleSubTotal += ((double.tryParse(item['price']) ?? 0) *
          item['counter_sale_quantity']);
    }
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
        title: "Sale",
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
        children: [
          CommonDottedBorderCard(
            borderColor: ConfigColors.lightText,
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
                      setState(() {
                        products.add(product);
                      });
                      print(product.toString());
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
          gapH20,
          CommonDottedBorderCard(
            borderColor: ConfigColors.lightText,
            strokeWidth: 0.5,
            onTap: () {},
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            customRadius: const Radius.circular(6),
            backgroundColor: ConfigColors.lightGreen,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: products.isNotEmpty
                    ? List.generate(
                        products.length,
                        (index) {
                          final item = products[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                        backgroundColor:
                                            const Color(0xFFf2f2f2),
                                        child: CachedNetworkImage(
                                          imageUrl: item['image'],
                                          placeholder: (context, url) =>
                                              Container(
                                            color: Colors.black12,
                                          ),
                                        ),
                                      ),
                                      gapW16,
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AppText.paragraphS16(
                                              item['name'],
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            gapH4,
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                AppText.paragraphS16(
                                                  "\$ ${item['price']}",
                                                  fontWeight: FontWeight.w600,
                                                  color: ConfigColors.primary2,
                                                ),
                                                CommonCounter(
                                                  value: item[
                                                          "counter_sale_quantity"]
                                                      .toString(),
                                                  onMinus: () async {
                                                    if (item[
                                                            "counter_sale_quantity"] >
                                                        1) {
                                                      setState(() {
                                                        item[
                                                            "counter_sale_quantity"]--;
                                                      });
                                                    } else {
                                                      setState(() {
                                                        products.remove(item);
                                                      });
                                                    }
                                                  },
                                                  onPlus: () async {
                                                    setState(() {
                                                      item[
                                                          "counter_sale_quantity"]++;
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    : [],
              ),
            ),
          ),
          gapH20,
          CommonDottedBorderCard(
            customRadius: const Radius.circular(6),
            backgroundColor: ConfigColors.lightGreen,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppText.paragraphS16(
                  "Total",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                AppText.paragraphS16(
                  "\$$counterSaleSubTotal",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: ConfigColors.primary2,
                ),
              ],
            ),
          ),
          gapH20,
          const AppText.paragraphS16(
            "Select payment method ",
            fontWeight: FontWeight.w500,
          ),
          gapH16,
          CommonListTile(
            leading: CommonCard(
              customRadius: BorderRadius.circular(10),
              showShadow: false,
              backgroundColor: const Color.fromRGBO(195, 121, 255, 0.1),
              padding: const EdgeInsets.all(10),
              child: Assets.paymentcard.svg(),
            ),
            title: const AppText.paragraphI16(
              "Payment by card",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            trailing: Transform.scale(
              scale: 1.2,
              child: Radio(
                activeColor: ConfigColors.primary,
                value: PaymentMethod.card,
                groupValue: _method,
                onChanged: (value) {
                  setState(() {
                    _method = value!;
                  });
                },
              ),
            ),
          ),
          gapH16,
          CommonListTile(
            leading: CommonCard(
              customRadius: BorderRadius.circular(10),
              showShadow: false,
              backgroundColor: ConfigColors.lightFerozi,
              padding: const EdgeInsets.all(10),
              child: Assets.cash.image(
                height: 18,
                color: ConfigColors.primary2,
              ),
            ),
            title: const AppText.paragraphI16(
              "Cash",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            trailing: Transform.scale(
              scale: 1.2,
              child: Radio(
                activeColor: ConfigColors.primary,
                value: PaymentMethod.cash,
                groupValue: _method,
                onChanged: (value) {
                  setState(() {
                    _method = value!;
                  });
                },
              ),
            ),
          ),
          gapH48,
          CommonButton(
            onPress: () async {
              await ref.read(ordersNotifierProvider.notifier).createOrder(
                data: {},
                products: products,
              );
            },
            synappButtonColor: SynappButtonColor.primary,
            text: 'Sell',
          ),
        ],
      ),
    );
  }
}
