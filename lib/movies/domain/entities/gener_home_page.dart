import 'package:equatable/equatable.dart';

class GenresHomePage extends Equatable {
  final String name;
  final int id;
  const GenresHomePage({
    required this.name,
    required this.id,
  });

  @override
  List<Object> get props => [name, id];
}
