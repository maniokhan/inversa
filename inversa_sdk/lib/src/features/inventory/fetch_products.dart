import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Map<String, dynamic>>> fetchAllProducts() async {
  try {
    QuerySnapshot productsSnapshot =
        await FirebaseFirestore.instance.collection('products').get();

    List<Map<String, dynamic>> products = [];

    productsSnapshot.docs.forEach((doc) {
      print('fetching and adding');
      final productData = doc.data() as Map<String, dynamic>?;

      if (productData != null) {
        products.add(productData);
      }
    });

    return products;
  } on FirebaseException catch (e) {
    print('Error fetching products: $e');
    return [];
  }
}
