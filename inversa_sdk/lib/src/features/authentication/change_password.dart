// TODO (abubakar): change firebase account password

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> changePassword(String newPassword) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user = auth.currentUser;

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
