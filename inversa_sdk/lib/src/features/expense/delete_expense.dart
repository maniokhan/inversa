// TODO (abubakar): delete expense

import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> deleteExpense(String expenseID) async {
  try {
    FirebaseFirestore.instance
        .collection('expenses')
        .doc(expenseID)
        .delete()
        .then((value) => {
              print('Expense deleted successfully'),
            });
  } on FirebaseException catch (e) {
    print('Error deleting expense: $e');
  }
}
