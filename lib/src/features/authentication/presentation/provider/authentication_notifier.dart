import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:inversaapp/main.dart';

class AuthenticationNotifier extends StateNotifier<bool> {
  AuthenticationNotifier() : super(false);

  Future<void> loginAccount(
    String email,
    String password,
  ) async {
    log('LOGIN ACCOUT');
    try {
      state = true;
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await appPrefs?.setBool('isLoggin', true);
    } catch (e) {
      throw Exception('something went wrong while login $e');
    } finally {
      state = false;
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
      state = true;
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
      await appPrefs?.setBool('isLoggin', true);
    } on FirebaseAuthException catch (e) {
      log('Failed with error code: ${e.code}');
    } finally {
      state = false;
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
      state = true;
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
      await appPrefs?.setBool('isLoggin', true);
    } on FirebaseAuthException catch (e) {
      log('Failed with error code: ${e.code}');
      log(e.message.toString());
    } finally {
      state = false;
    }
  }

  // Todo (abubakar) : Register Account
  Future<void> resgiterAccount({
    required String email,
    required String password,
    required Map<String, dynamic> data,
  }) async {
    try {
      state = true;
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final String? userId = FirebaseAuth.instance.currentUser?.uid;
      data['user_id'] = userId;
      data['address'] = "";
      data['store_name'] = "";

      await FirebaseFirestore.instance.collection('user_accounts').add(data);
      await appPrefs?.setBool('isLoggin', true);
    } catch (e) {
      throw Exception('something went wrong while register account');
    } finally {
      state = false;
    }
  }

  Future<void> changePassword(
    String currentPassword,
    String newPassword,
    String confirmPassword,
  ) async {
    try {
      state = true;
      var currentUser = FirebaseAuth.instance.currentUser;
      if (newPassword != confirmPassword) {
        throw "New password and confirm password do not match.";
      }
      await currentUser!.updatePassword(newPassword);
      log("Password changed successfully.");
    } catch (e) {
      throw Exception('something went wrong while change password');
    } finally {
      state = false;
    }
  }

  Future<void> logoutAccount() async {
    try {
      state = true;
      await FirebaseAuth.instance.signOut();
      // await GoogleSignIn().signOut();
      // await FacebookAuth.instance.logOut();
      await appPrefs?.setBool('isLoggin', false);
    } catch (e) {
      throw Exception('Something went wrong while logout');
    } finally {
      state = false;
    }
  }
}
