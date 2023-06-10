import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:health_app/utils/globals.dart';

class AuthService{

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    final authResult = await FirebaseAuth.instance.signInWithCredential(credential);

    final email = gUser.email;

    await _firestore.collection('users').doc(authResult.user!.uid).set({
      // 'username' : username,
      'uid' : authResult.user!.uid,
      // 'bio' : bio,
      'email' : email,
      // 'photoUrl' : photoUrl
      'quiz score' : 0,
      'read speed' : 0,
      'read' : 0,
      'total score': 0
    });

    currentUserEmail = email;
    print("Currrrrrr ======    " + currentUserEmail);

    return authResult;
  }
}