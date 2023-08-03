import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shoppingCartNotifierProvider =
    StateNotifierProvider<ShoppingCartNotifierProvider, bool>(
  (ref) => ShoppingCartNotifierProvider(),
);

class ShoppingCartNotifierProvider extends StateNotifier<bool> {
  ShoppingCartNotifierProvider() : super(false);
  final collectionRef = FirebaseFirestore.instance.collection("shopping_carts");
  String? userId = FirebaseAuth.instance.currentUser?.uid;

  Future<void> createShoppingCart({
    required Map<String, dynamic> data,
  }) async {
    try {
      data['user_id'] = userId;
      await collectionRef.add(data);
    } catch (e) {
      throw Exception('something went wrong updateShoppingCart');
    }
  }

  Future<void> updateShoppingCart({
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await collectionRef.doc(documentId).update(data);
    } catch (e) {
      throw Exception('somethinf went wrong updateShoppingCart');
    }
  }

  Future<void> deleteProductShoppingCart(
    String documentId,
  ) async {
    try {
      await collectionRef.doc(documentId).delete();
    } catch (e) {
      throw Exception('somethinf went wrong deleteShoppingCart');
    }
  }

  Future<void> deleteShoppingCart() async {
    state = true;
    try {
      final batch = FirebaseFirestore.instance.batch();

      await collectionRef
          .where('user_id', isEqualTo: userId)
          .get()
          .then((querySnapshot) {
        for (var document in querySnapshot.docs) {
          batch.delete(document.reference);
        }

        return batch.commit();
      });
    } catch (e) {
      throw Exception('somethinf went wrong deleteShoppingCart');
    } finally {
      state = false;
    }
  }
}
