// TODO (abubakar): login with firebase with email and password
import 'package:firebase_auth/firebase_auth.dart';

Future<void> loginWithFirebase(String email, String password) async {
  FirebaseAuth auth = FirebaseAuth.instance;

  try {
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    print('User logged in successfully');
  } on FirebaseAuthException catch (e) {
    print('Error logging in user: $e');
  }
}
