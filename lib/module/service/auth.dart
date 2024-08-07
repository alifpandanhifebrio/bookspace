import 'dart:developer';

import 'package:bookapp/core.dart';
import 'package:bookapp/widgets/regex.dart';
import 'package:bookapp/widgets/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthMethoods {
  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser() async {
    return auth.currentUser;
  }

  signInWithGoogle(BuildContext context) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    final GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication?.idToken,
        accessToken: googleSignInAuthentication?.accessToken);

    UserCredential result = await firebaseAuth.signInWithCredential(credential);
    User? userDetails = result.user;

    Map<String, dynamic> userInfoMap = {
      "email": userDetails!.email,
      "name": userDetails.displayName,
      "imgUrl": userDetails.photoURL,
      "id": userDetails.uid
    };
    await DatabaseMethods().addUser(userDetails.uid, userInfoMap).then((value) {
      Get.to(const SignUpSuccessView());
    });
  }

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
      UserCredential credential = await auth.createUserWithEmailAndPassword(
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
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      _handleAuthError(e);
    }
    return null;
  }

  Future<void> signOut() async {
    try {
      await auth.signOut();
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
