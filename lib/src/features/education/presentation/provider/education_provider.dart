import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final educationVideoProvider = StreamProvider.autoDispose(
  (ref) {
    final controller = StreamController<Iterable<Map<String, dynamic>>>();

    final sub = FirebaseFirestore.instance
        .collection(
          'education_video',
        )
        .snapshots()
        .listen(
      (snapshot) {
        if (snapshot.docs.isNotEmpty) {
          final educationVideo = snapshot.docs.map((doc) => doc.data());
          controller.add(educationVideo);
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
