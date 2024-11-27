// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userdataModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UsreDataAdapter extends TypeAdapter<UsreData> {
  @override
  final int typeId = 0;

  @override
  UsreData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UsreData(
      userName: fields[0] as String?,
      passWord: fields[1] as String?,
      phoneNumber: fields[2] as String?,
      mailId: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UsreData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.userName)
      ..writeByte(1)
      ..write(obj.passWord)
      ..writeByte(2)
      ..write(obj.phoneNumber)
      ..writeByte(3)
      ..write(obj.mailId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsreDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
