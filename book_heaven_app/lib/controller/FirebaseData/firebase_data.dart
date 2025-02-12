import 'dart:developer';

import 'package:book_heaven_app/controller/SharedPrefernceData/session_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseData {
  static FirebaseFirestore firebaseInstance = FirebaseFirestore.instance;

  ///
  static Future<String> createUserAccount(
      Map<String, dynamic> userCredential) async {
    try {
      ///FIREBASE AUTHENTICATION FOR CREATE USER/SIGN UP WITH USER AND PASSWORD

      UserCredential userCredentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: userCredential["email"],
              password: userCredential["password"]);

      ///ADDING USERS DATA TO FIRESTORE DATABASE
      await firebaseInstance
          .collection("Users")
          .doc(userCredential["email"])
          .set(userCredential);

      log("$userCredentials");
      return "true";
    } on FirebaseAuthException catch (e) {
      log(e.code);
      return e.code;
    }
  }

  ///
  static Future<String> signUserAccount(Map userCredential) async {
    try {
      ///FIREBASE AUTHENTICATION FOR SIGN IN WITH USER AND PASSWORD
      UserCredential userCredentials = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: userCredential["email"],
              password: userCredential["password"]);

      ///FETCHING USERS DATA FROM FIRESTORE DATABASE
      QuerySnapshot response = await firebaseInstance.collection("Users").get();
      bool isUserPresent = false;

      ///TO GET USER DATA
      for (var data in response.docs) {
        if (data["email"] == userCredential["email"]) {
          ///STORING THE EXACT USER DATA TO SHAREDPREFERENCE DATABASE
          await SessionData.storeSessiondata(
              isLogin: true, email: data["email"], username: data["username"]);
          isUserPresent = true;
          break;
        }
      }

      if (!isUserPresent) {
        log("No User Present");
        throw Exception("No User Present");
      }
      log("$userCredentials");
      return "true";
    } on FirebaseAuthException catch (e) {
      log(e.code);

      return e.code;
    } catch (error) {
      return error.toString();
    }
  }

  ///Logout
  static Future<void> logoutFromFirebase() async {
    await FirebaseAuth.instance.signOut();
    await SessionData.storeSessiondata(isLogin: false, email: "", username: "");
  }
}
