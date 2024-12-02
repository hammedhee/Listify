// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groceryList.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GroceryListDataAdapter extends TypeAdapter<GroceryListData> {
  @override
  final int typeId = 1;

  @override
  GroceryListData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GroceryListData(
      groceryName: fields[0] as String?,
      quantity: fields[1] as String?,
      catocary: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GroceryListData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.groceryName)
      ..writeByte(1)
      ..write(obj.quantity)
      ..writeByte(3)
      ..write(obj.catocary);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroceryListDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
