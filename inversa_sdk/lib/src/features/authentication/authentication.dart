import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Authentication {
  static Future<void> changePassword(String newPassword) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    User? user = _auth.currentUser;

    try {
      // changing password in firebase authentication
      await user!.updatePassword(newPassword);

      // update password in cloud firestore
      await FirebaseFirestore.instance
          .collection('user_accounts')
          .doc(user.uid)
          .update({
        'password': newPassword,
      }).then((value) => {
                print('User password changed successfully'),
              });
    } catch (e) {
      print('Error changing user password: $e');
    }
  }

  static Future<void> createNewAccount(
      String email, String password, Map<String, dynamic> userData) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      // creating user in firebase auth
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // storing user data in cloud firestore
      User? user = userCredential.user;

      FirebaseFirestore.instance
          .collection('user_accounts')
          .doc(user!.uid)
          .set(userData)
          .then((value) => {
                print('New account created successfully'),
              });
    } on FirebaseAuthException catch (e) {
      print('Error creating new account: $e');
    }
  }

  static Future<Map<String, dynamic>> getUserById(String uid) async {
    Map<String, dynamic> userData = {};
    DocumentSnapshot docSnap = await FirebaseFirestore.instance
        .collection('user_accounts')
        .doc(uid)
        .get();

    if (docSnap.data() != null) {
      userData = docSnap.data() as Map<String, dynamic>;
    }
    return userData;
  }

  static Future<void> loginWithFirebase(String email, String password) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('User logged in successfully');
    } on FirebaseAuthException catch (e) {
      print('Error logging in user: $e');
    }
  }

  static Future<void> logout() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      await _auth.signOut().then((value) => {
            print('logged out successfully'),
          });
    } on FirebaseAuthException catch (e) {
      print('Error logging out user: $e');
    }
  }

  static Future<void> updateUserAccount(
      String userId, Map<String, dynamic> updatedUserData) async {
    try {
      await FirebaseFirestore.instance
          .collection('user_accounts')
          .doc(userId)
          .update(updatedUserData)
          .then((value) => {
                print('User data updated successfully'),
              });
    } on FirebaseException catch (e) {
      print('Error updating user data: $e');
    }
  }
}
