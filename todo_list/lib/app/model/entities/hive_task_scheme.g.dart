// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_task_scheme.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveTaskSchemeAdapter extends TypeAdapter<HiveTaskScheme> {
  @override
  final int typeId = 0;

  @override
  HiveTaskScheme read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveTaskScheme(
      fields[0] as String,
      fields[1] as String,
      fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, HiveTaskScheme obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.dueDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveTaskSchemeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
