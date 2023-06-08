import 'package:firebase_auth/firebase_auth.dart';

User? currentUser(
  String email,
  String password,
) {
  return FirebaseAuth.instance.currentUser;
}