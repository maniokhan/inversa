// TODO (abubakar): get all data by auth user id
import 'package:cloud_firestore/cloud_firestore.dart';

Future<Map<String, dynamic>> getUserById(String uid) async {
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
