import 'package:inversaapp/src/features/authentication/presentation/provider/authentication_notifier.dart';
import 'package:inversaapp/src/features/authentication/presentation/provider/authentication_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logged_in_provider.g.dart';

@riverpod
AuthState loggedIn(LoggedInRef ref) {
  final Auth authProvider = ref.watch(authenticationProvider);
  return authProvider.authState;
}