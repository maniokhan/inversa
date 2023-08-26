inversapp@gmail.com
Inversa2023!

# com.inversaapp

A new Flutter pr
## Getting Starteds

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
# com.inversaapp


  // void _logInWithFacebook() async {
  //   setState(() {
  //     isLoggedIn = true;
  //   });
  //   try {
  //     // final result = await FacebookAuth.instance.login();
  //     // final userData = await FacebookAuth.instance.getUserData();
  //     // final facebookAuthCredential =
  //     //     FacebookAuthProvider.credential(result.accessToken!.token);
  //     // await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

  //     Navigator.of(context).push(
  //       MaterialPageRoute(
  //         builder: (context) => const StoreHomeScreen(),
  //       ),
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     Navigator.pop(context);
  //     print('Error: $e');

  //     showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           content: Text(e.toString(),
  //               style: const TextStyle(color: Colors.black, fontSize: 15)),
  //           contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
  //         );
  //       },
  //     );
  //   } finally {
  //     setState(() {
  //       isLoggedIn = false;
  //     });
  //   }
  // }

  // Future<void> signInWithFirebase() async {
  //   try {
  //     final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: _emailController.text,
  //       password: _passwordController.text,
  //     );

  //     final info = credential.additionalUserInfo!.username;
  //     print("username: $info");
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       print('No user found for that email.');
  //     } else if (e.code == 'wrong-password') {
  //       print('Wrong password provided for that user.');
  //     }
  //   }
  // }
...