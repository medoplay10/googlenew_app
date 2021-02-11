import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'Home.dart';

class GoogleSignInProvider  {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();

    Future signGoogleFun({@required BuildContext  context} ) async{
      try{
        //trigger Authentication Flow
        final GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
        print( "googleSignInAccount = " +googleSignInAccount.toString());
        if(googleSignInAccount !=null){
          //Obtaining auth details from the request
          final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
          print("googleSignInAuthentication = "+ googleSignInAuthentication.toString());

          //Creating new credential
          final GoogleAuthCredential credential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken
          );
          print("credential = "+credential.toString());

          print("credential accessToken = "+credential. accessToken);
          User user = (await _firebaseAuth.signInWithCredential(credential)).user;
          print(  "User = "+user.providerData.toString());



          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Home(),
          ));

        }


      }catch(e){
        print(e);
      }
    }

    Future signOutWithGoogle()async{
       await  _googleSignIn.signOut();
       print("User Out");
    }



}