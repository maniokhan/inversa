import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AuthState { loggedIn, logout, notRegistered }

class Auth {
  final AuthState authState;
  final bool isLoading;
  Auth({
    required this.authState,
    this.isLoading = false,
  });

  Auth copyWith({
    AuthState? authState,
    bool? isLoading,
  }) {
    return Auth(
      authState: authState ?? this.authState,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class AuthenticationNotifier extends StateNotifier<Auth> {
  AuthenticationNotifier() : super(Auth(authState: AuthState.logout)) {
    if (FirebaseAuth.instance.currentUser != null) {
      state = Auth(
        authState: AuthState.loggedIn,
      );
    }
  }

  void changeState(AuthState value) {
    state = Auth(authState: value);
  }

  Future<void> loginAccount(
    String email,
    String password,
  ) async {
    try {
      state = state.copyWith(isLoading: true);
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      state = Auth(authState: AuthState.loggedIn);
    } catch (e) {
      throw Exception('something went wrong while login');
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> loginWithFacebookAccount() async {}

  Future<void> resgiterAccount({
    required String email,
    required String password,
    required Map<String, dynamic> data,
  }) async {
    try {
      state = state.copyWith(isLoading: true);
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final String? userId = FirebaseAuth.instance.currentUser?.uid;
      data['user_id'] = userId;
      await FirebaseFirestore.instance.collection('user_accounts').add(data);
      state = Auth(authState: AuthState.loggedIn);
    } catch (e) {
      throw Exception('something went wrong while register account');
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> changePassword(
    String currentPassword,
    String newPassword,
    String confirmPassword,
  ) async {
    try {
      state = state.copyWith(isLoading: true);
      var currentUser = FirebaseAuth.instance.currentUser;
      if (newPassword != confirmPassword) {
        throw "New password and confirm password do not match.";
      }
      await currentUser!.updatePassword(newPassword);
      print("Password changed successfully.");
    } catch (e) {
      throw Exception('something went wrong while change password');
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> logoutAccount() async {
    try {
      state = state.copyWith(isLoading: true);
      await FirebaseAuth.instance.signOut();
      state = Auth(authState: AuthState.logout);
    } catch (e) {
      throw Exception('Something went wrong while logout');
    }
  }
}
