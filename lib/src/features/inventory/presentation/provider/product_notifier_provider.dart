import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductNotifierProvider extends StateNotifier<bool> {
  ProductNotifierProvider() : super(false);

  Future<void> updateProduct(
      {required String documentId, required Map<String, dynamic> data}) async {
    try {
      await FirebaseFirestore.instance
          .collection("products")
          .doc(documentId)
          .update(data);
    } catch (e) {
      throw Exception("Something went wrong when update");
    }
  }
}
