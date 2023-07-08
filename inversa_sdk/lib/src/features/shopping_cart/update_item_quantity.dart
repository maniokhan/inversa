import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> updateItemQuantity(
    String productId, Map<String, dynamic> updatedItemData) async {
  try {
    DocumentReference cartRef =
        FirebaseFirestore.instance.collection('shopping_cart').doc(productId);

    await cartRef.update(updatedItemData).then((value) => {
          print('Item quantity updated successfully.'),
        });
  } on FirebaseException catch (e) {
    print('Error adding item to cart: $e');
  }
}
