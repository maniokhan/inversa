import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum AuthState {
  loggedIn,
  logout,
  notRegistered,
  selectRole,
  storeLoggedIn,
  clientLoggedIn
}

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
        authState: AuthState.selectRole,
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
      state = Auth(authState: AuthState.selectRole);
    } catch (e) {
      throw Exception('something went wrong while login $e');
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> loginWithFacebookAccount() async {
    final loginResult = await FacebookAuth.instance.login();
    final token = loginResult.accessToken?.token;
    if (token == null) {
      return;
    }
    final oauthCredentials = FacebookAuthProvider.credential(token);
    try {
      state = state.copyWith(isLoading: true);
      final userDetails =
          (await FirebaseAuth.instance.signInWithCredential(oauthCredentials))
              .user!;
      final String? userId = FirebaseAuth.instance.currentUser?.uid;
      final Map<String, dynamic> data = {
        'user_id': userId,
        'name': userDetails.displayName ?? '',
        'address': '',
        'store_name': '',
        'email': userDetails.email ?? '',
      };
      await FirebaseFirestore.instance.collection('user_accounts').add(data);
      state = Auth(authState: AuthState.selectRole);
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
      // final email = e.email;
      // final credential = e.credential;
      // if (e.code == 'account-exists-with-different-credential' &&
      //     email != null &&
      //     credential != null) {
      //   final providers =
      //       await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      //   if (providers.contains('google.com')) {
      //     await loginWithGoogle();
      //     FirebaseAuth.instance.currentUser?.linkWithCredential(credential);
      //   }
      // }
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn(scopes: [
      'email',
    ]).signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    try {
      state = state.copyWith(isLoading: true);
      final userDetails =
          (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
      final String? userId = FirebaseAuth.instance.currentUser?.uid;
      final Map<String, dynamic> data = {
        'user_id': userId,
        'name': userDetails.displayName ?? '',
        'address': '',
        'store_name': '',
        'email': userDetails.email ?? '',
      };
      await FirebaseFirestore.instance.collection('user_accounts').add(data);
      state = Auth(authState: AuthState.selectRole);
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  // Todo (abubakar) : Register Account
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
      data['address'] = "";
      data['store_name'] = "";

      await FirebaseFirestore.instance.collection('user_accounts').add(data);
      state = Auth(authState: AuthState.selectRole);
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
      await GoogleSignIn().signOut();
      await FacebookAuth.instance.logOut();
      state = Auth(authState: AuthState.logout);
    } catch (e) {
      throw Exception('Something went wrong while logout');
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
