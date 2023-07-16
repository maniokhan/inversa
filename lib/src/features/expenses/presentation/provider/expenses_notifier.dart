import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpensesNotifier extends StateNotifier<bool> {
  ExpensesNotifier() : super(false);
  final userId = FirebaseAuth.instance.currentUser?.uid;

  Future<void> addRentExpense(
    double expense,
  ) async {
    await FirebaseFirestore.instance
        .collection('expenses')
        .add({"user_id": userId, "category": "rent"});
  }

  Future<void> addElectricityExpense(
    double expense,
  ) async {
    await FirebaseFirestore.instance
        .collection('expenses')
        .add({"user_id": userId, "category": "electricity"});
  }

  Future<void> addWaterExpense(
    double expense,
  ) async {
    await FirebaseFirestore.instance
        .collection('expenses')
        .add({"user_id": userId, "category": "water"});
  }

  Future<void> addMaintetananceExpense(
    double expense,
  ) async {
    await FirebaseFirestore.instance
        .collection('expenses')
        .add({"user_id": userId, "category": "maintetanance"});
  }

  Future<void> addEmployeeExpense(
    double expense,
  ) async {
    await FirebaseFirestore.instance
        .collection('expenses')
        .add({"user_id": userId, "category": "employee"});
  }
}
