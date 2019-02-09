import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthImpl {
  Future<String> signIn(String email, String password);
  Future<String> signUp(String email, String password);
  Future<String> getCurrentUser();
  Future<void> signOut();
  String getUID();
}

class Auth implements AuthImpl {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String uid = '----';
  String getUID(){
    return uid;
  }
  Future<String> signIn(String email, String password) async {
    FirebaseUser user = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return user.uid;
  }

  Future<String> signUp(String email, String password) async {
    FirebaseUser user = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return user.uid;
  }

  Future<String> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    if (user == null)
      return null;
    else {
      uid = user.uid;
      return user.uid;
    }
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
}