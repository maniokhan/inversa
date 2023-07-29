

// final homeProvider = StreamProvider.autoDispose<Map<String, dynamic>>((ref) {
//   final controller = StreamController<Map<String, dynamic>>();

//   final FirebaseFirestore firebaseFire = FirebaseFirestore.instance;
//   final expenseSub = firebaseFire
//       .collection('expenses')
//       .where('user_id', isEqualTo: '')
//       .snapshots()
//       .listen((event) {});

//   final productsSub = firebaseFire
//       .collection('products')
//       .where('user_id', isEqualTo: '')
//       .snapshots()
//       .listen((event) {});

//   final ordersSub = firebaseFire
//       .collection('orders')
//       .where('user_id', isEqualTo: '')
//       .snapshots()
//       .listen((event) {});

//   ref.onDispose(() {
//     expenseSub.cancel();
//     productsSub.cancel();
//     ordersSub.cancel();
//     controller.close();
//   });
// });
