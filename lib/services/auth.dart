import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream userStream = FirebaseAuth.instance.authStateChanges();

  Future<void> signInWithEmailAndPassword({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (error) {
      print('Error signInWithEmailAndPassword: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Something has happened. Try login again.'),
          duration: Duration(
            seconds: 1,
          ),
        ),
      );
    }
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut({
    required BuildContext context,
  }) async {
    if (currentUser == ConnectionState.waiting) {
      CircularProgressIndicator();
    } else {
      try {
        await _firebaseAuth.signOut();
      } on FirebaseAuthException catch (error) {
        print('Error signInAnonymously: $error');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Something has happened. Try login again.'),
            duration: Duration(
              seconds: 1,
            ),
          ),
        );
      }
    }
  }

  Future<void> sendPasswordResetEmail({required String email}) async {
    _firebaseAuth.sendPasswordResetEmail(email: email);
  }

//Anonymous SignIn Method
  Future<void> signInAnonymously({
    required BuildContext context,
  }) async {
    try {
      await _firebaseAuth.signInAnonymously();
      Navigator.of(context).pushNamed('/topics');
    } on FirebaseAuthException catch (error) {
      print('Error signInAnonymously: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Something has happened. Try login again.'),
          duration: Duration(
            seconds: 1,
          ),
        ),
      );
    }
  }
}
