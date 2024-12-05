// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groceryList.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GroceryListDataAdapter extends TypeAdapter<GroceryListData> {
  @override
  final int typeId = 2;

  @override
  GroceryListData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GroceryListData(
      groceryName: fields[0] as String?,
      quantity: fields[1] as String?,
      catocary: fields[2] as String?,
      value: fields[3] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, GroceryListData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.groceryName)
      ..writeByte(1)
      ..write(obj.quantity)
      ..writeByte(2)
      ..write(obj.catocary)
      ..writeByte(3)
      ..write(obj.value);
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
