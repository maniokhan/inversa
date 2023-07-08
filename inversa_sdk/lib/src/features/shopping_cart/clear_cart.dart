import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> clearCart() async {
  try {
    CollectionReference cartRef =
        FirebaseFirestore.instance.collection('shopping_cart');

    QuerySnapshot querySnapshot = await cartRef.get();

    // Iterate over the cart items and delete each document
    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      await doc.reference.delete();
    }

    print('All cart items deleted successfully.');
  } catch (e) {
    print('Error deleting cart items: $e');
  }
}
