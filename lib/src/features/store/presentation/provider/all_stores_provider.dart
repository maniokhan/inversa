import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final allStoresProvider =
    StreamProvider.autoDispose<Iterable<Map<String, dynamic>>>(
  (ref) {
    final controller = StreamController<Iterable<Map<String, dynamic>>>();

    final sub = FirebaseFirestore.instance
        .collection('stores')
        .snapshots()
        .listen((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        final allStores = snapshot.docs.map((doc) => doc.data());
        controller.add(allStores);
      }
    });

    ref.onDispose(() {
      sub.cancel();
      controller.close();
    });

    return controller.stream;
  },
);
