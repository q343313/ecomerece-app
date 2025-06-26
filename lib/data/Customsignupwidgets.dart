


import 'package:ecomrece_app/boxes/boxes.dart';
import 'package:ecomrece_app/data/signup_screens/loginscreens.dart';
import 'package:ecomrece_app/model/profile_models.dart';
import 'package:ecomrece_app/repository/screens/home_screens/homescreens.dart';
import 'package:ecomrece_app/repository/screens/navigationscreens/navigationbarscreens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomDataWidget{

  signup(String username,String email,String password, String number,image,BuildContext context)async{
    try{

      UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Account Created Succesfully")));
      var data = ProfileModel(
          username: username,
          email: email,
          password: password,
          number: number,
          image: image);
      var box= Boxes.profiledata();
      box.add(data);
      data.save();

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const Center(child: CircularProgressIndicator()),
      );



      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NavigationBarScreen()));
      Navigator.pop(context);

    }on FirebaseAuthException catch(e){
      if(e.code == "email-already-in-use"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Already Exists")));
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginscreens()));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Something Wrong ${e.toString()}")));
      }
    }
  }


  loginaccount(String email,String password,username,number,image,BuildContext context)async{
    try{

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const Center(child: CircularProgressIndicator()),
      );


      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Account")));
      var data = ProfileModel(
          username: username,
          email: email,
          password: password,
          number: number,
          image: image);
      var box= Boxes.profiledata();
      box.add(data);
      data.save();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NavigationBarScreen()));

    }on FirebaseAuthException catch(e){
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Something Wrong! ${e.toString()}")));
    }
  }

resetpassword(String email,BuildContext context)async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email Send For Reset password")));

    }on FirebaseAuthException catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Something Wrong!! ${e.toString()}")));
    }
}


}