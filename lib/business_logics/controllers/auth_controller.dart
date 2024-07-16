/*
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:ecommerce/ui/route/route.dart';
//import 'package:ecommerce/ui/style/app_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoesphere/ui/route/route.dart';
import 'package:shoesphere/ui/style/app_styles.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final box = GetStorage();

  signUp(name, email, password, context) async {
    AppStyles().progressDialog(context);
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user!.uid.isNotEmpty) {
        CollectionReference collectionReference =
            FirebaseFirestore.instance.collection('users');
        collectionReference
            .doc(email)
            .set({'uid': credential.user!.uid, 'email': email, 'name': name});

        Map user = {'uid': credential.user!.uid, 'email': email, 'name': name};
        box.write('user', user);
        print(box.read('user'));
        Get.back();
        Get.offAndToNamed(bottomNav);
        Get.showSnackbar(AppStyles().successSnacBar('SignUp successfull'));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.back();
        Get.showSnackbar(
            AppStyles().failedSnacBar('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        Get.back();
        Get.showSnackbar(AppStyles()
            .failedSnacBar('The account already exists for that email.'));
      }
    } catch (e) {
      Get.back();
      Get.showSnackbar(AppStyles().failedSnacBar(e));
    }
  }

  login(email, password, context) async {
    AppStyles().progressDialog(context);
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (credential.user!.uid.isNotEmpty) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(email)
            .get()
            .then((DocumentSnapshot<Map<String, dynamic>> doc) {
          if (doc.exists) {
            var data = doc.data();
            print(data);
            Map user = {
              'uid': data!['uid'],
              'email': data['email'],
              'name': data['name']
             };
            box.write('user', user);
            print(user);
            Get.back();
            Get.offAndToNamed(bottomNav);
            Get.showSnackbar(AppStyles().successSnacBar('Login successfull'));
          } else {
            Get.showSnackbar(AppStyles()
                .failedSnacBar('document does not exist on the database.'));
          }
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.back();
        Get.showSnackbar(
            AppStyles().failedSnacBar('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        Get.back();
        Get.showSnackbar(AppStyles()
            .failedSnacBar('Wrong password provided for that user.'));
      }
    }
  }

  forgetPassword(email, context) async {
    try {
      AppStyles().progressDialog(context);
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Get.back();
      Get.showSnackbar(
          AppStyles().successSnacBar('email has been sent to $email'));
    } catch (e) {
      Get.back();
      Get.showSnackbar(AppStyles().failedSnacBar('something is wrong.'));
    }
  }
  Future<void> logout() async {
    try {
      _auth.signOut();
    } catch (e) {
      print('Error logging out: $e');
    }
  }



}

 */

//perfect code

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shoesphere/ui/route/route.dart';
import 'package:shoesphere/ui/style/app_styles.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final box = GetStorage();

  void signUp(String name, String email, String password, BuildContext context) async {
    AppStyles().progressDialog(context);
    try {
      final UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user!.uid.isNotEmpty) {
        await FirebaseFirestore.instance.collection('users').doc(email).set({
          'uid': credential.user!.uid,
          'email': email,
          'name': name,
        });

        Map<String, dynamic> user = {
          'uid': credential.user!.uid,
          'email': email,
          'name': name,
        };
        box.write('user', user);
        Get.back();
        Get.offAllNamed(bottomNav);
        Get.showSnackbar(AppStyles().successSnacBar('Sign up successful'));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.back();
        Get.showSnackbar(AppStyles().failedSnacBar('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        Get.back();
        Get.showSnackbar(AppStyles().failedSnacBar('The account already exists for that email.'));
      } else {
        Get.back();
        Get.showSnackbar(AppStyles().failedSnacBar('Failed to create account: ${e.message}'));
      }
    } catch (e) {
      Get.back();
      Get.showSnackbar(AppStyles().failedSnacBar('Failed to create account: $e'));
    }
  }

  void login(String email, String password, BuildContext context) async {
    AppStyles().progressDialog(context);
    try {
      final UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user!.uid.isNotEmpty) {
        final DocumentSnapshot<Map<String, dynamic>> doc = await FirebaseFirestore.instance
            .collection('users')
            .doc(email)
            .get();

        if (doc.exists) {
          Map<String, dynamic> data = doc.data()!;
          Map<String, dynamic> user = {
            'uid': data['uid'],
            'email': data['email'],
            'name': data['name'],
          };
          box.write('user', user);
          Get.back();
          Get.offAllNamed(bottomNav);
          Get.showSnackbar(AppStyles().successSnacBar('Login successful'));
        } else {
          Get.showSnackbar(AppStyles().failedSnacBar('User data not found'));
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.back();
        Get.showSnackbar(AppStyles().failedSnacBar('No user found for that email'));
      } else if (e.code == 'wrong-password') {
        Get.back();
        Get.showSnackbar(AppStyles().failedSnacBar('Wrong password provided for that user'));
      } else {
        Get.back();
        Get.showSnackbar(AppStyles().failedSnacBar('Failed to sign in: ${e.message}'));
      }
    } catch (e) {
      Get.back();
      Get.showSnackbar(AppStyles().failedSnacBar('Failed to sign in: $e'));
    }
  }

  void signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        final DocumentSnapshot<Map<String, dynamic>> doc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.email)
            .get();

        if (doc.exists) {
          Map<String, dynamic> data = doc.data()!;
          Map<String, dynamic> user = {
            'uid': data['uid'],
            'email': data['email'],
            'name': data['name'],
          };
          box.write('user', user);
          Get.offAllNamed(bottomNav);
          Get.showSnackbar(AppStyles().successSnacBar('Login successful'));
        } else {
          Get.showSnackbar(AppStyles().failedSnacBar('User data not found'));
        }
      } else {
        Get.showSnackbar(AppStyles().failedSnacBar('Failed to sign in with Google'));
      }
    } catch (e) {
      print('Error signing in with Google: $e');
      Get.showSnackbar(AppStyles().failedSnacBar('Error signing in with Google'));
    }
  }

  void forgetPassword(String email, BuildContext context) async {
    try {
      AppStyles().progressDialog(context);
      await _auth.sendPasswordResetEmail(email: email);
      Get.back();
      Get.showSnackbar(AppStyles().successSnacBar('Password reset email sent to $email'));
    } catch (e) {
      Get.back();
      Get.showSnackbar(AppStyles().failedSnacBar('Failed to send password reset email: $e'));
    }
  }

  void logout() async {
    try {
      await _auth.signOut();
      Get.offAllNamed(login as String);
    } catch (e) {
      print('Error logging out: $e');
      Get.showSnackbar(AppStyles().failedSnacBar('Error logging out'));
    }
  }
}






