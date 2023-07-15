import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/features/expenses/domain/expense.dart';

final totalExpensesProvider = StreamProvider.autoDispose<Expense>(
  (ref) {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    final controller = StreamController<Expense>();

    final sub = FirebaseFirestore.instance
        .collection('expenses')
        .where('user_id', isEqualTo: userId)
        .snapshots()
        .listen((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        final allExpenses = snapshot.docs.map((doc) => doc.data());

        double rentPrice = 0;
        double electricityPrice = 0;
        double waterPrice = 0;
        double maintenancePrice = 0;
        double employeePrice = 0;
        double otherPrice = 0;

        for (var expense in allExpenses) {
          rentPrice += expense["category"] == "rent" ? expense["price"] : 0;
          electricityPrice +=
              expense["category"] == "electricity" ? expense["price"] : 0;
          waterPrice += expense["category"] == "water" ? expense["price"] : 0;
          maintenancePrice +=
              expense["category"] == "maintenance" ? expense["price"] : 0;
          employeePrice +=
              expense["category"] == "employee" ? expense["price"] : 0;
          otherPrice += expense["category"] == "other" ? expense["price"] : 0;
        }

        controller.add(Expense(
          totalEmployeeExpense: employeePrice,
          totalElectricityExpense: electricityPrice,
          totalMaintenanceExpense: maintenancePrice,
          totalOtherExpense: otherPrice,
          totalRentExpense: rentPrice,
          totalWaterExpense: waterPrice,
        ));
      }
    });

    ref.onDispose(() {
      sub.cancel();
      controller.close();
    });

    return controller.stream;
  },
);
