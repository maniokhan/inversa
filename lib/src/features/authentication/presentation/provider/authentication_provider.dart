import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/features/authentication/presentation/provider/authentication_notifier.dart';

final StateNotifierProvider<AuthenticationNotifier, bool>
    authenticationProvider =
    StateNotifierProvider<AuthenticationNotifier, bool>(
        (StateNotifierProviderRef<AuthenticationNotifier, bool> ref) {
  return AuthenticationNotifier();
});
