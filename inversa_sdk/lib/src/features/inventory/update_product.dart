import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> updateProduct(
    String productId, Map<String, dynamic> updatedData) async {
  try {
    CollectionReference productsRef =
        FirebaseFirestore.instance.collection('products');
    DocumentReference productDocRef = productsRef.doc(productId);

    await productDocRef.update(updatedData);

    print('Product updated successfully!');
  } catch (e) {
    print('Error updating product: $e');
  }
}
