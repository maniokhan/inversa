import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/features/store/expenses/expenses_notifier.dart';

final expenseProvider = StateNotifierProvider<ExpensesNotifier, bool>((ref) {
  return ExpensesNotifier();
});
