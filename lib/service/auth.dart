import 'dart:developer';

import 'package:bookapp/widgets/regex.dart';
import 'package:bookapp/widgets/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    if (!CRegex.isValidEmail(email)) {
      showToast(message: 'Email tidak valid');
      return null;
    }
    if (!CRegex.isOwaspPassword(password)) {
      showToast(message: 'Password tidak memenuhi syarat keamanan');
      return null;
    }

    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      _handleAuthError(e);
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    if (!CRegex.isValidEmail(email)) {
      showToast(message: 'Email tidak valid');
      return null;
    }
    if (!CRegex.isOwaspPassword(password)) {
      showToast(message: 'Password tidak memenuhi syarat keamanan');
      return null;
    }

    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      _handleAuthError(e);
    }
    return null;
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      log("Error during sign out: ${e.toString()}");
    }
  }

  void _handleAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        showToast(message: 'Email sudah digunakan');
        break;
      case 'user-not-found':
      case 'wrong-password':
        showToast(message: 'Email atau password salah.');
        break;
      case 'weak-password':
        showToast(message: 'Password terlalu lemah.');
        break;
      case 'invalid-email':
        showToast(message: 'Email tidak valid.');
        break;
      default:
        showToast(message: 'Terjadi kesalahan: ${e.code}');
        log("Auth error: ${e.toString()}");
    }
  }
}
