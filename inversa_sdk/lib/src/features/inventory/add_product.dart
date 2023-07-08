import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addProduct(
    Map<String, dynamic> productData, String productID) async {
  try {
    CollectionReference productsRef =
        FirebaseFirestore.instance.collection('products');
    await productsRef.doc(productID).set(productData);

    print('Product uploaded successfully!');
  } on FirebaseException catch (e) {
    print('Error uploading product: $e');
  }
}
