import 'package:inversaapp/src/features/authentication/presentation/authentication_notifier.dart';
import 'package:inversaapp/src/features/authentication/presentation/authentication_provider.dart';
import 'package:inversaapp/src/features/user_account_notifier_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_loading_provider.g.dart';

@riverpod
bool isLoading(IsLoadingRef ref) {
  final bool userAccount = ref.watch(userAccountNotifierProvider);
  final Auth authState = ref.watch(authenticationProvider);
  return authState.isLoading || userAccount;
}
