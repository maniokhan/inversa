import 'package:firebase_auth/firebase_auth.dart';

Future<void> logout() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  try {
    await auth.signOut().then((value) => {
          print('logged out successfully'),
        });
  } on FirebaseAuthException catch (e) {
    print('Error logging out user: $e');
  }
}
