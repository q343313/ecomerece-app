


import 'package:ecomrece_app/model/productmodels/productmodel.dart';
import 'package:ecomrece_app/model/profile_models.dart';
import 'package:hive/hive.dart';

class Boxes{
  static Box<ProfileModel>profiledata()=>Hive.box<ProfileModel>("profile");
  static Box<ProductModels>productdata() =>Hive.box<ProductModels>("product");
}