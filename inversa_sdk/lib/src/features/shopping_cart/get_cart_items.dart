import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Map<String, dynamic>>> getCartItems() async {
  try {
    CollectionReference cartRef =
        FirebaseFirestore.instance.collection('shopping_cart');

    QuerySnapshot querySnapshot = await cartRef.get();

    List<Map<String, dynamic>> cartItems = [];

    querySnapshot.docs.forEach((doc) {
      cartItems.add(doc.data() as Map<String, dynamic>);
    });

    return cartItems;
  } on FirebaseException catch (e) {
    print('Error retrieving cart items: $e');
    return [];
  }
}

// Usage example
