import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_app/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String email,
    required String password,
    // required String username,
    // required String bio,
    // required Uint8List file,

  }) async {
    String res = "some error occurred";
    try{
      if(email.isNotEmpty || password.isNotEmpty){
        UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);

        // String photoUrl = await StorageMethods().uploadImageToStorage('ProfilePics', file, false);


        await _firestore.collection('users').doc(cred.user!.uid).set({
          // 'username' : username,
          'uid' : cred.user!.uid,
          // 'bio' : bio,
          'email' : email,
          // 'photoUrl' : photoUrl
          'quiz score' : 0,
          'read speed' : 0,
          'read' : 0,
          'total score': 0
        });
        res = "success";
      } 
    }
    catch(err) {
      res = err.toString();
    }
    return res;
  }


  Future<String> loginUser({
    required String email,
    required String password
  }) async {
    String res = "Wrong Email or Password";

  try {
      if(email.isNotEmpty || password.isNotEmpty){
          _auth.signInWithEmailAndPassword(email: email, password: password)
          .then((UserCredential userCredential) {
          // User sign-in successful, access user and credential properties
          User? user = userCredential.user;
          if(user != null){
            res = "success";
          }
        })
        .catchError((error) {
          // Handle sign-in error
          print(error);
        });
      }
  }

    // try {
    //   if(email.isNotEmpty || password.isNotEmpty){
    //       _auth.signInWithEmailAndPassword(email: email, password: password);
    //       res = "success";
    //   }
    //   else{
    //     res = "Please enter all the fields";
    //   }
    // }
    catch(err) {
      res = err.toString();
    }
    return res;
  }
}