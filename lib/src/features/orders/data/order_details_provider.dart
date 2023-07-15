import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderDetailsProvider = StreamProvider.family.autoDispose((ref, orderId) {

  
  final controller = StreamController<Iterable<Map<String, dynamic>>>();

  final sub = FirebaseFirestore.instance
      .doc('orders/$orderId')
      .collection('products')
      .snapshots()
      .listen((snapshot) {
    final allProducts = snapshot.docs.map((doc) => doc.data());
    controller.add(allProducts);
  });

  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });

  return controller.stream;
});
