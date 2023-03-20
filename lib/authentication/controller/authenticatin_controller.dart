// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController {
  late User user;

  googleSignIn() async {
    //Beginning of Google sign In
    try {
      //Initialisation of Google Sign In
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      //Google Sign In Authentication to obtain details
      final GoogleSignInAuthentication gAuth = await gUser!.authentication;

      //Google Sign In credentials
      final credential = GoogleAuthProvider.credential(
          accessToken: gAuth.accessToken, idToken: gUser.id);

      //Sign in Google Firebase Authentication
      final result =
          await FirebaseAuth.instance.signInWithCredential(credential);
      if (!result.user!.emailVerified) {
        print('Login Cancelled');
      } else if (result.additionalUserInfo!.isNewUser) {
        // CRAETE USER
        print('SUCCESSFULYY CREATED USER');
      } else {
        print('ALL READY EXISTS THE USER');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
