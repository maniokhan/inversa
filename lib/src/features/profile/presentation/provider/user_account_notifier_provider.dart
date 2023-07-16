import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/features/profile/presentation/provider/user_account_notifier.dart';

final userAccountNotifierProvider =
    StateNotifierProvider<UserAccountNotifier, bool>((ref) {
  return UserAccountNotifier();
});
