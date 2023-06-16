// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:inversa/src/features/authentication/presentation/sign_in_screen.dart';

class HomeScreen extends StatefulWidget {
  final String username;
  final String profilePicUrl;
  static Route<HomeScreen> route() {
    return MaterialPageRoute(builder: (context) => HomeScreen());
  }

  const HomeScreen({
    Key? key,
    this.username = '',
    this.profilePicUrl = '',
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: widget.profilePicUrl,
              height: 50,
              placeholder: (context, url) {
                return const Center(child: CircularProgressIndicator());
              },
              errorWidget: (context, url, error) {
                return Container(
                  alignment: Alignment.center,
                  child: const Icon(Icons.error),
                );
              },
            ),
            const SizedBox(height: 6),
            Text(widget.username),
            TextButton(
              onPressed: () {
                FacebookAuth.instance.logOut();
                FirebaseAuth.instance.signOut();
                GoogleSignIn().signOut();
                Navigator.push(context, LoginScreen.route());
              },
              child: const Text("Log Out"),
            ),
          ],
        ),
      ),
    );
  }
}
