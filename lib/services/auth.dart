// import 'package:cloud_firestore/cloud_firestore.dart';
// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //auth changes user stream
  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  //sign in anonymously
  Future signInAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //sign in with email and password

  //register with email and  password

  //logout
}
