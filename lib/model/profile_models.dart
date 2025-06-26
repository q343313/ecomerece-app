

import 'package:hive/hive.dart';

part 'profile_models.g.dart';

@HiveType(typeId: 0)
class ProfileModel extends HiveObject{

  @HiveField(0)
  String username;
  @HiveField(1)
  String email;
  @HiveField(2)
  String password;
  @HiveField(3)
  String number;
  @HiveField(4)
  String image;

  ProfileModel({
    required this.username,
    required this.email,
    required this.password,
    required this.number,
    required this.image
});
}