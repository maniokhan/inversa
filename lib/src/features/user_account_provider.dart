import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userAccountProvider = StreamProvider.autoDispose((ref) {
  final String? userId = FirebaseAuth.instance.currentUser?.uid;

  final controller = StreamController();
  final sub = FirebaseFirestore.instance
      .collection("user_accounts")
      .where("user_id", isEqualTo: userId)
      .limit(1)
      .snapshots()
      .listen((snapshot) {
    Map<String, dynamic> userAccount = snapshot.docs.first.data();

    userAccount['documentId'] = snapshot.docs.first.id;
    controller.add(userAccount);
  });

  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });

  return controller.stream;
});
