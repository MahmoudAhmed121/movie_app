import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';


part 'gener_home_page.g.dart';
@HiveType(typeId: 2)
class GenresHomePage extends Equatable {
@HiveField(0)
  final String name;
  @HiveField(1)
  final int id;
  const GenresHomePage({
    required this.name,
    required this.id,
  });

  @override
  List<Object> get props => [name, id];
}
