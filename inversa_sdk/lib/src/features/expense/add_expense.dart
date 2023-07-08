// TODO (abubakar): add expense

import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addExpense(
    Map<String, dynamic> expenseData, String expenseID) async {
  try {
    FirebaseFirestore.instance
        .collection('expenses')
        .doc(expenseID)
        .set(expenseData)
        .then((value) => {
              print('Expense added successfully'),
            });
  } on FirebaseException catch (e) {
    print('Error adding expense: $e');
  }
}
