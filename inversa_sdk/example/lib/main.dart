import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = Uuid();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  TextEditingController emailController = TextEditingController();

  TextEditingController password = TextEditingController();

  String expenseId = uuid.v1();
  Map<String, dynamic> expenseData = {
    'expense_name': 'rent',
    'price': 12550,
    'created_at': Timestamp.now(),
    'user_id': '4VONSd9vNYO8Hu18G7LOSsI6qSe2',
    'expense_id': '',
  };

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
          totalPrice += data['price'] ?? 0;
        }
      });

      print('Total price of $expenseName: $totalPrice');
    } on FirebaseException catch (e) {
      print('Error retrieving total price: $e');
    }

    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'email',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) async {},
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                    hintText: 'password',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) async {},
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  expenseData['expense_id'] = expenseId;
                  addExpense(expenseData, expenseId);
                },
                child: Text('add expense'),
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () async {
                  updateExpense(
                      expenseData, '78dd0bc0-129a-11ee-bab8-510f6b320987');
                },
                child: Text('update expense'),
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () async {
                  //deleteExpense('78dd0bc0-129a-11ee-bab8-510f6b320987');
                  var expense = await getTotalExpenseByExpenseName(
                      'rent', '4VONSd9vNYO8Hu18G7LOSsI6qSe2');

                  print('Total Expense : $expense');
                },
                child: Text('get total expance expense'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
