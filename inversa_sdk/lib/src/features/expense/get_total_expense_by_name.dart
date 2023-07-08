// TODO (abubakar): get total expense by name

import 'package:cloud_firestore/cloud_firestore.dart';

Future<double> getTotalExpenseByExpenseName(
    String expenseName, String userId) async {
  double totalPrice = 0;

  try {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('expenses')
        .where('user_id', isEqualTo: userId)
        .where('expense_name', isEqualTo: expenseName)
        .get();

    snapshot.docs.forEach((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      if (data != null) {
        totalPrice += data['amount'] ?? 0;
      }
    });

    print('Total price of $expenseName: $totalPrice');
  } on FirebaseException catch (e) {
    print('Error retrieving total price: $e');
  }

  return totalPrice;
}
