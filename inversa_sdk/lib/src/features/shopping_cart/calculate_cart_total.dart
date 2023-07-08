calculateCartTotal(List<Map<String, dynamic>> cartItems) {
  num totalAmount = 0;

  cartItems.forEach((element) {
    totalAmount = totalAmount + element['total_product_price'];
  });
  return totalAmount;
}
