import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> createNewAccount(
    String email, String password, Map<String, dynamic> userData) async {
  FirebaseAuth auth = FirebaseAuth.instance;

  try {
    // creating user in firebase auth
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
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
