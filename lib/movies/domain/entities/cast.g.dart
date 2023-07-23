// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CastAdapter extends TypeAdapter<Cast> {
  @override
  final int typeId = 3;

  @override
  Cast read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cast(
      name: fields[0] as String,
      photo: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Cast obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.photo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CastAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
