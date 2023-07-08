import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> deleteProduct(String productId) async {
  try {
    CollectionReference productsRef =
        FirebaseFirestore.instance.collection('products');
    DocumentReference productDocRef = productsRef.doc(productId);

    await productDocRef.delete();

    print('Product deleted successfully!');
  } on FirebaseException catch (e) {
    print('Error deleting product: $e');
  }
}
