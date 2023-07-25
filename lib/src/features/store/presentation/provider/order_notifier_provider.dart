import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ordersNotifierProvider =
    StateNotifierProvider<OrderNotifier, bool>((ref) {
  return OrderNotifier();
});

class OrderNotifier extends StateNotifier<bool> {
  OrderNotifier() : super(false);
  final orderCollectionRef = FirebaseFirestore.instance.collection("orders");

  Future<void> createOrder({
    required Map<String, dynamic> data,
    required Iterable<Map<String, dynamic>> products,
  }) async {
    state = true;
    try {
      final documentRef = await orderCollectionRef.add(data);

      for (var item in products) {
        await documentRef.collection("products").add(item);
      }
    } catch (e) {
      throw Exception("submitOrder something went wrong $e");
    } finally {
      state = false;
    }
  }
}
