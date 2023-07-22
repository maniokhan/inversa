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
      .where("user_id", isEqualTo: userId)
      .snapshots()
      .listen((event) {
    final allCategories = event.docs.map((cate) {
      Map<String, dynamic> category = <String, dynamic>{};
      category = cate.data();
      category["documentId"] = {"documentId": cate.id};
      return category;
    }).toList();

    controller.add(allCategories);
  });

  ref.onDispose(() {
    controller.close();
    sub.cancel();
  });

  return controller.stream;
});
