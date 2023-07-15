import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final allProductsProvider =
    StreamProvider.autoDispose<Iterable<Map<String, dynamic>>>(
  (ref) {
    final controller = StreamController<Iterable<Map<String, dynamic>>>();

    final sub = FirebaseFirestore.instance
        .collection('products')
        .snapshots()
        .listen((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        final allProducts = snapshot.docs.map((doc) => doc.data());
        controller.add(allProducts);
      }
    });

    ref.onDispose(() {
      sub.cancel();
      controller.close();
    });

    return controller.stream;
  },
);
