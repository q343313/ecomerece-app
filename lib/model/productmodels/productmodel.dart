



import 'package:hive/hive.dart';
part 'productmodel.g.dart';

@HiveType(typeId: 1)
class ProductModels extends HiveObject{

  @HiveField(0)
  String name;
  @HiveField(1)
  String email;
  @HiveField(2)
  String number;
  @HiveField(3)
  String image;


  @HiveField(4)
  String productname;
  @HiveField(5)
  String productiamge;
  @HiveField(6)
  String productlocation;
  @HiveField(7)
  String description;
  @HiveField(8)
  String productprice;
  @HiveField(9)
  String categry;
  @HiveField(10)
  DateTime dateTime;

  ProductModels({
    required this.name,
    required this.email,
    required this.image,
    required this.number,
    required this.productname,
    required this.description,
    required this.productprice,
    required this.productlocation,
    required this.productiamge,
    required this.categry,
    required this.dateTime
});
}