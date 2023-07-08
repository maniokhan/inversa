// TODO (abubakar): update expense

import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> updateExpense(
    Map<String, dynamic> updatedExpenseData, String expenseID) async {
  try {
    FirebaseFirestore.instance
        .collection('expenses')
        .doc(expenseID)
        .update(updatedExpenseData)
        .then((value) => {
              print('Expense updated successfully'),
            });
  } on FirebaseException catch (e) {
    print('Error updated expense: $e');
  }
}
