// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grafModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GrafListDataAdapter extends TypeAdapter<GrafListData> {
  @override
  final int typeId = 3;

  @override
  GrafListData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GrafListData(
      grafValue: fields[0] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, GrafListData obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.grafValue);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GrafListDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
