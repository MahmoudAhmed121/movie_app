// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gener_home_page.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GenresHomePageAdapter extends TypeAdapter<GenresHomePage> {
  @override
  final int typeId = 2;

  @override
  GenresHomePage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GenresHomePage(
      name: fields[0] as String,
      id: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, GenresHomePage obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenresHomePageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
