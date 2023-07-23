import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final allStoresProvider =
    StreamProvider.autoDispose<Iterable<Map<String, dynamic>>>(
  (ref) {
    final controller = StreamController<Iterable<Map<String, dynamic>>>();

    final sub = FirebaseFirestore.instance
        .collection('user_accounts')
        .where("role", isEqualTo: "store")
        .snapshots()
        .listen(
      (snapshot) {
        if (snapshot.docs.isNotEmpty) {
          final allStores = snapshot.docs.map((doc) {
            Map<String, dynamic> store = <String, dynamic>{};
            store = doc.data();
            store["documentId"] = doc.id;
            return store;
          }).toList();
          controller.add(allStores);
        } else {
          controller.add([]);
        }
      },
    );

    ref.onDispose(() {
      sub.cancel();
      controller.close();
    });

    return controller.stream;
  },
);
