import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addToCart(
    String productId, Map<String, dynamic> productData) async {
  try {
    DocumentReference cartRef =
        FirebaseFirestore.instance.collection('shopping_cart').doc(productId);

    await cartRef.set(productData).then((value) => {
          print('Item added to cart successfully.'),
        });
  } on FirebaseException catch (e) {
    print('Error adding item to cart: $e');
  }
}
