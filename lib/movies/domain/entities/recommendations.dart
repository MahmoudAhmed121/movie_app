import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';

part 'recommendations.g.dart';
@HiveType(typeId: 4)
class Recommendations extends Equatable {
  @HiveField(0)
  final String? backdropPath;
  @HiveField(1)
  final int id;
  const Recommendations(
    {
      required this.backdropPath,
    required this.id,
  });

  @override
  List<Object?> get props => [backdropPath, id];
}
