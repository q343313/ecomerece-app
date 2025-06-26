// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductModelsAdapter extends TypeAdapter<ProductModels> {
  @override
  final int typeId = 1;

  @override
  ProductModels read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModels(
      name: fields[0] as String,
      email: fields[1] as String,
      image: fields[3] as String,
      number: fields[2] as String,
      productname: fields[4] as String,
      description: fields[7] as String,
      productprice: fields[8] as String,
      productlocation: fields[6] as String,
      productiamge: fields[5] as String,
      categry: fields[9] as String,
      dateTime: fields[10] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ProductModels obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.number)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.productname)
      ..writeByte(5)
      ..write(obj.productiamge)
      ..writeByte(6)
      ..write(obj.productlocation)
      ..writeByte(7)
      ..write(obj.description)
      ..writeByte(8)
      ..write(obj.productprice)
      ..writeByte(9)
      ..write(obj.categry)
      ..writeByte(10)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModelsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
