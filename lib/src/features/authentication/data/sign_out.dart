import 'package:firebase_auth/firebase_auth.dart';

Future<void> signOut(
  String email,
  String password,
) async {
  await FirebaseAuth.instance.signOut();
}

