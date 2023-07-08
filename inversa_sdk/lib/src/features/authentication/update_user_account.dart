import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> updateUserAccount(
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
