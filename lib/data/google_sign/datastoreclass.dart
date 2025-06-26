


import 'package:cloud_firestore/cloud_firestore.dart';

class DataStoreClass{
  Future getuserdata(String id,Map<String,dynamic>userinfomap){
    return FirebaseFirestore.instance.collection("userid").doc(id).set(userinfomap);
  }
}