import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TODO (abubakar) : show on list tab
final allProductsProvider =
    StreamProvider.autoDispose<Iterable<Map<String, dynamic>>>((ref) {
  final controller = StreamController<Iterable<Map<String, dynamic>>>();

  final userId = FirebaseAuth.instance.currentUser?.uid;

  final sub = FirebaseFirestore.instance
      .collection("products")
      .where("user_id", isEqualTo: userId)
      .snapshots()
      .listen((event) {
    final allProducts = event.docs.map((pro) {
      Map<String, dynamic> product = <String, dynamic>{};
      product = pro.data();
      product["documentId"] = {"documentId": pro.id};
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
