import 'package:firebase_auth/firebase_auth.dart';

Future<void> signInWithEmailAndPassword(
  String email,
  String password,
) async {
  await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password,
  );
}
