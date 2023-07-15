import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderProvider = StreamProvider.family
    .autoDispose<Iterable<Map<String, dynamic>>, bool>((ref, isClient) {
  final controller = StreamController<Iterable<Map<String, dynamic>>>();

  final userId = FirebaseAuth.instance.currentUser?.uid;
  final field = isClient ? "user_id" : "store_id";

  final sub = FirebaseFirestore.instance
      .collection('orders')
      .where(
        field,
        isEqualTo: userId,
      )
      .snapshots()
      .listen((snapshot) {
    final allProducts = snapshot.docs.map((doc) {
      Map<String, dynamic> item = doc.data();
      item["order_id"] = doc.id;
      return item;
    });
    controller.add(allProducts);
  });

  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });

  return controller.stream;
});
