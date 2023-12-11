import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:inversaapp/main.dart';

class AuthenticationNotifier extends StateNotifier<bool> {
  AuthenticationNotifier() : super(false);

  Future<void> loginAccount(
    String email,
    String password,
  ) async {
    print('LOGIN ACCOUT');
    try {
      state = true;
      // final String? deviceToken = await FirebaseMessaging.instance.getToken();
      print('LOGINED ACCOUT');

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      await appPrefs?.setBool('isLoggin', true);
      // final String userId = FirebaseAuth.instance.currentUser!.uid;

      // QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      //     .collection('user_accounts')
      //     .where('user_id', isEqualTo: userId)
      //     .get();

      // if (querySnapshot.docs.isNotEmpty) {
      //   String docId = querySnapshot.docs.first.id;

      //   FirebaseFirestore.instance
      //       .collection('user_accounts')
      //       .doc(docId)
      //       .update({'device_token': deviceToken ?? ''});
      // } else {
      //   // Handle the case where no matching document is found
      //   return;
      // }
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
      await Geolocator.requestPermission();

      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      // final String? deviceToken = await FirebaseMessaging.instance.getToken();
      final QuerySnapshot result = await FirebaseFirestore.instance
          .collection('user_accounts')
          .where('user_id', isEqualTo: userId)
          .get();
      print('userid: $result');
      final Map<String, dynamic> data = {
        'user_id': userId,
        'name': userDetails.displayName ?? '',
        'address': '',
        'store_name': '',
        'password': "",
        'email': userDetails.email ?? '',
        'store_location': GeoPoint(
          position.latitude,
          position.longitude,
        ),
        // 'device_token': deviceToken ?? '',
      };
      if (result.docs.isEmpty) {
        // User does not exist, create a new document.
        await FirebaseFirestore.instance.collection('user_accounts').add(data);
      }
      await appPrefs?.setBool('isLoggin', true);
    } on FirebaseAuthException catch (e) {
      log('Failed with error code: ${e.code}');
      // final email = e.email;
      // final credential = e.credential;
      // if (e.code == 'account-Exists-With-Different-Credential' &&
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
      await Geolocator.requestPermission();

      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      // final String? deviceToken = await FirebaseMessaging.instance.getToken();
      final QuerySnapshot result = await FirebaseFirestore.instance
          .collection('user_accounts')
          .where('user_id', isEqualTo: userId)
          .get();

      final Map<String, dynamic> data = {
        'user_id': userId,
        'name': userDetails.displayName ?? '',
        'address': '',
        'store_name': '',
        'password': "",
        'email': userDetails.email ?? '',
        'store_location': GeoPoint(
          position.latitude,
          position.longitude,
        ),
        // 'device_token': deviceToken ?? '',
      };
      if (result.docs.isEmpty) {
        // User does not exist, create a new document.
        await FirebaseFirestore.instance.collection('user_accounts').add(data);
      }
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
      // final String? deviceToken = await FirebaseMessaging.instance.getToken();
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await Geolocator.requestPermission();

      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final String? userId = FirebaseAuth.instance.currentUser?.uid;
      data['user_id'] = userId;
      data['address'] = "";
      data['store_name'] = "";
      // data['device_token'] = deviceToken ?? '';
      data['store_location'] = GeoPoint(
        position.latitude,
        position.longitude,
      );

      await FirebaseFirestore.instance.collection('user_accounts').add(data);
      await appPrefs?.setBool('isLoggin', true);
    } catch (e) {
      throw Exception('something went wrong while register account');
    } finally {
      state = false;
    }
  }

  Future<void> changePassword(
    String newPassword,
  ) async {
    try {
      state = true;
      var currentUser = FirebaseAuth.instance.currentUser;
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

      if (GoogleSignIn().currentUser != null) {
        await GoogleSignIn().signOut();
      }
      await FacebookAuth.instance.logOut();
      await appPrefs?.setBool('isLoggin', false);
    } catch (e) {
      throw Exception('Something went wrong while logout');
    } finally {
      state = false;
    }
  }
}
