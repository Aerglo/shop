// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 1;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product(
      name: fields[0] as String,
      price: fields[1] as int,
      description: (fields[2] as List).cast<String>(),
      category: fields[3] as String,
      productId: fields[7] as int,
      imageAsset: fields[8] as String?,
      sellCounts: fields[6] as int,
    )
      ..isSelected = fields[4] as bool
      ..isFavourited = fields[5] as bool;
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.isSelected)
      ..writeByte(5)
      ..write(obj.isFavourited)
      ..writeByte(6)
      ..write(obj.sellCounts)
      ..writeByte(7)
      ..write(obj.productId)
      ..writeByte(8)
      ..write(obj.imageAsset);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
