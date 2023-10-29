import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final allCategoryProvider =
    StreamProvider.autoDispose<Iterable<Map<String, dynamic>>>((ref) {
  final userId = FirebaseAuth.instance.currentUser!.uid;

  final controller = StreamController<Iterable<Map<String, dynamic>>>();

  final sub = FirebaseFirestore.instance
      .collection("categories")
      // .where("user_id", isEqualTo: userId)
      .snapshots()
      .listen((snapshot) {
    if (snapshot.docs.isNotEmpty) {
      final allCategories = snapshot.docs.map((doc) {
        Map<String, dynamic> category = <String, dynamic>{};
        category = doc.data();
        category["documentId"] = doc.id;
        return category;
      }).toList();

      controller.add(allCategories);
    } else {
      controller.add([]);
    }
  });

  ref.onDispose(() {
    controller.close();
    sub.cancel();
  });

  return controller.stream;
});
