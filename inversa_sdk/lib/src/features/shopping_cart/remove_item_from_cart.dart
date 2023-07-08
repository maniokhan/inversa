import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> removeCartItem(String productId) async {
  try {
    DocumentReference cartRef =
        FirebaseFirestore.instance.collection('shopping_cart').doc(productId);

    await cartRef.delete().then((value) => {
          print('Item removed.'),
        });
  } on FirebaseException catch (e) {
    print('Error adding item to cart: $e');
  }
}
