import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryProductsProvider = StreamProvider.family
    .autoDispose<Iterable<Map<String, dynamic>>, String>((ref, categoryId) {
  final controller = StreamController<Iterable<Map<String, dynamic>>>();

  final sub = FirebaseFirestore.instance
      .collection("products")
      .where("category_id", isEqualTo: categoryId)
      .snapshots()
      .listen((event) {
    final allProducts = event.docs.map((doc) {
      Map<String, dynamic> product = <String, dynamic>{};
      product = doc.data();
      product["documentId"] = doc.id;
      return product;
    }).toList();

    controller.add(allProducts);
  });

  ref.onDispose(() {
    controller.close();
    sub.cancel();
  });

  return controller.stream;
});
