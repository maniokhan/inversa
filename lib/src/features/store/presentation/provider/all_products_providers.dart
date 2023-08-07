import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/features/store/presentation/provider/search_notifier_provider.dart';

final allProductsProvider =
    StreamProvider.family.autoDispose<Iterable<Map<String, dynamic>>, String?>((
  ref,
  userId,
) {
  final controller = StreamController<Iterable<Map<String, dynamic>>>();

  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? shoppingCartSub;

  final sub = FirebaseFirestore.instance
      .collection("products")
      .where(
        "user_id",
        isEqualTo: userId,
      )
      .snapshots()
      .listen((event) {
    final allProducts = event.docs.map((doc) {
      Map<String, dynamic> product = <String, dynamic>{};
      product = doc.data();
      product["documentId"] = doc.id;
      product["counter_sale_quantity"] = 1;
      product["isShoppingCart"] = false;

      shoppingCartSub = FirebaseFirestore.instance
          .collection('shopping_carts')
          .where('product_id', isEqualTo: doc.id)
          .limit(1)
          .snapshots()
          .listen((event) {
        if (event.docs.isNotEmpty) {
          product["isShoppingCart"] = true;
          product['shopping_cart_id'] = event.docs.first.id;
        } else {
          product["isShoppingCart"] = false;
        }
      });

      return product;
    }).toList();

    Iterable<Map<String, dynamic>> allItems = {};
    final searchWord = ref.watch(searchNotifierProvider);
    if (searchWord.isNotEmpty) {
      allItems = allProducts.where((element) {
        return element['name']
            .toString()
            .trim()
            .toLowerCase()
            .contains(searchWord.trim().toLowerCase());
      });
    } else {
      allItems = allProducts;
    }

    controller.add(allItems);
  });

  ref.onDispose(() {
    controller.close();
    sub.cancel();
    shoppingCartSub?.cancel();
  });

  return controller.stream;
});
