import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserAccountNotifier extends StateNotifier<bool> {
  UserAccountNotifier() : super(false);

  Future<void> updateUserAccount({
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    state = true;
    try {
      await FirebaseFirestore.instance
          .collection("user_accounts")
          .doc(documentId)
          .update(
            data,
          );
    } catch (e) {
      Exception("updateUserAccount Something went wrong $e");
    } finally {
      state = false;
    }
  }
}
