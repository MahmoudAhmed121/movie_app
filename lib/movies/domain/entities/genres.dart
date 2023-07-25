import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';


part 'genres.g.dart';
@HiveType(typeId: 5)
class Genres extends Equatable {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int id;

  const Genres({
    required this.name,
    required this.id,
  });

  @override
  List<Object> get props => [name, id];
}
