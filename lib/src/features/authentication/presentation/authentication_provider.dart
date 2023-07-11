import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inversaapp/src/features/authentication/presentation/authentication_notifier.dart';

final authenticationProvider =
    StateNotifierProvider<AuthenticationNotifier, Auth>((ref) {
  return AuthenticationNotifier();
});
