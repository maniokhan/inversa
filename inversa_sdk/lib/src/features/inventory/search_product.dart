List<Map<String, dynamic>> searchProducts(
    String query, List<Map<String, dynamic>> products) {
  List<Map<String, dynamic>> productResults;
  productResults = products.where((element) {
    return element['product_name'].toLowerCase().contains(query.toLowerCase());
  }).toList();
  return productResults;
}
