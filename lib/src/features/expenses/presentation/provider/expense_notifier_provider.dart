import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/extensions/try_parse_to_int.dart';

final expenseNotifierProvider =
    StateNotifierProvider<ExpensesNotifier, bool>((ref) {
  return ExpensesNotifier();
});

class ExpensesNotifier extends StateNotifier<bool> {
  ExpensesNotifier() : super(false);
  final userId = FirebaseAuth.instance.currentUser?.uid;

  Future<void> createExpense({
    required String rent,
    required String electricity,
    required String water,
    required String maintenance,
    required String employees,
    required String other,
  }) async {
    state = true;
    try {
      if (rent.isNotEmpty) {
        await FirebaseFirestore.instance.collection('expenses').add(
          {
            'name': 'rent',
            'price': rent.tryParseToInt(),
            'created_at': FieldValue.serverTimestamp(),
            'user_id': userId,
          },
        );
      }

      if (electricity.isNotEmpty) {
        await FirebaseFirestore.instance.collection('expenses').add(
          {
            'name': 'electricity',
            'price': electricity.tryParseToInt(),
            'created_at': FieldValue.serverTimestamp(),
            'user_id': userId,
          },
        );
      }

      if (water.isNotEmpty) {
        await FirebaseFirestore.instance.collection('expenses').add(
          {
            'name': 'water',
            'price': water.tryParseToInt(),
            'created_at': FieldValue.serverTimestamp(),
            'user_id': userId,
          },
        );
      }

      if (maintenance.isNotEmpty) {
        await FirebaseFirestore.instance.collection('expenses').add(
          {
            'name': 'maintenance',
            'price': maintenance.tryParseToInt(),
            'created_at': FieldValue.serverTimestamp(),
            'user_id': userId,
          },
        );
      }

      if (employees.isNotEmpty) {
        await FirebaseFirestore.instance.collection('expenses').add(
          {
            'name': 'employees',
            'price': employees.tryParseToInt(),
            'created_at': FieldValue.serverTimestamp(),
            'user_id': userId,
          },
        );
      }

      if (other.isNotEmpty) {
        await FirebaseFirestore.instance.collection('expenses').add(
          {
            'name': 'other',
            'price': other.tryParseToInt(),
            'created_at': FieldValue.serverTimestamp(),
            'user_id': userId,
          },
        );
      }
    } catch (e) {
      Exception('something went wrong addRentExpense');
    } finally {
      state = false;
    }
  }
}
