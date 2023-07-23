import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';


part 'cast.g.dart';

@HiveType(typeId: 3)
class Cast extends Equatable {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String photo;
  const Cast({
    required this.name,
    required this.photo,
  });

  @override
  List<Object> get props => [
        name,
        photo
      ];
}
