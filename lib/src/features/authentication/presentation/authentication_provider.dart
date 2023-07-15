import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/features/authentication/presentation/authentication_notifier.dart';

final StateNotifierProvider<AuthenticationNotifier, Auth>
    authenticationProvider =
    StateNotifierProvider<AuthenticationNotifier, Auth>(
        (StateNotifierProviderRef<AuthenticationNotifier, Auth> ref) {
  return AuthenticationNotifier();
});
