import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/features/expenses/presentation/provider/expenses_notifier.dart';

final expenseProvider = StateNotifierProvider<ExpensesNotifier, bool>((ref) {
  return ExpensesNotifier();
});
