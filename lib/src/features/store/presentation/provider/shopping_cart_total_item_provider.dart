import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shoppingCartTotalItemProvider = StreamProvider.autoDispose<int>((ref) {
  final userId = FirebaseAuth.instance.currentUser!.uid;

  final controller = StreamController<int>();

  final sub = FirebaseFirestore.instance
      .collection("shopping_carts")
      .where("user_id", isEqualTo: userId)
      .snapshots()
      .listen((snapshot) {
    if (snapshot.docs.isNotEmpty) {
      final allShoppingCart = snapshot.docs.map((doc) {
        Map<String, dynamic> shoppingCart = <String, dynamic>{};
        shoppingCart = doc.data();
        shoppingCart["documentId"] = doc.id;
        return shoppingCart;
      }).toList();

      controller.add(allShoppingCart.length);
    } else {
      controller.add(0);
    }
  });

  ref.onDispose(() {
    controller.close();
    sub.cancel();
  });

  return controller.stream;
});
