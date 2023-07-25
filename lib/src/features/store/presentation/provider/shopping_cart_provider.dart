import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shoppingCartProvider =
    StreamProvider.autoDispose<Iterable<Map<String, dynamic>>>((ref) {
  final controller = StreamController<Iterable<Map<String, dynamic>>>();

  final String? userId = FirebaseAuth.instance.currentUser?.uid;

  final sub = FirebaseFirestore.instance
      .collection("shopping_cart")
      .where("user_id", isEqualTo: userId)
      .snapshots()
      .listen((snapshot) {
    final allItems = snapshot.docs.map((doc) => doc.data());
    controller.add(allItems);
  });

  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });

  return controller.stream;
});
