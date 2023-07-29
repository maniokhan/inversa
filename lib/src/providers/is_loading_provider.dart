import 'package:inversaapp/src/features/authentication/presentation/provider/authentication_notifier.dart';
import 'package:inversaapp/src/features/authentication/presentation/provider/authentication_provider.dart';
import 'package:inversaapp/src/features/expenses/presentation/provider/expense_notifier_provider.dart';
import 'package:inversaapp/src/features/profile/presentation/provider/user_account_notifier_provider.dart';
import 'package:inversaapp/src/features/store/presentation/provider/order_notifier_provider.dart';
import 'package:inversaapp/src/features/store/presentation/provider/shopping_cart_notifier_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_loading_provider.g.dart';

@riverpod
bool isLoading(IsLoadingRef ref) {
  final bool userAccount = ref.watch(userAccountNotifierProvider);
  final Auth authState = ref.watch(authenticationProvider);
  final bool expenseState = ref.watch(expenseNotifierProvider);
  final bool ordersNotifierValue = ref.watch(ordersNotifierProvider);
  final bool shoppingCartNotifierValue =
      ref.watch(shoppingCartNotifierProvider);
  return authState.isLoading ||
      userAccount ||
      expenseState ||
      ordersNotifierValue ||
      shoppingCartNotifierValue;
}
