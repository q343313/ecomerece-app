


import 'package:ecomrece_app/boxes/boxes.dart';
import 'package:ecomrece_app/data/google_sign/datastoreclass.dart';
import 'package:ecomrece_app/model/profile_models.dart';
import 'package:ecomrece_app/repository/screens/home_screens/homescreens.dart';
import 'package:ecomrece_app/repository/screens/navigationscreens/navigationbarscreens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthMethods{

  FirebaseAuth auth = FirebaseAuth.instance;

  gtCurreentUser()async{
    return await auth.currentUser;

  }

  googlesignin(BuildContext context)async{
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount?googleSignInAccount =await googleSignIn.signIn();

    final GoogleSignInAuthentication?googleSignInAuthentication  = await googleSignInAccount!.authentication;


    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication?.idToken,
      accessToken: googleSignInAuthentication?.accessToken
    );

    UserCredential result=await firebaseAuth.signInWithCredential(credential);

    User? UserDetail = result.user;

    if(result != null){
      Map<String,dynamic>userinformap = {
        "name":UserDetail!.displayName,
        "email":UserDetail!.email,
        "id":UserDetail!.uid,
        "imag":UserDetail.photoURL,
        "number":UserDetail.phoneNumber
      };

      // final data = ProfileModel(
      //     username: userinformap["name"],
      //     email: userinformap["email"],
      //     password: userinformap["id"],
      //     number: userinformap["number"],
      //     image: userinformap["imag"]
      // );
      //
      // final box = Boxes.profiledata();
      // box.add(data);
      // data.save();

      DataStoreClass().getuserdata(UserDetail.uid, userinformap).then((value){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NavigationBarScreen()));
      });
    }

  }

}