import 'package:equatable/equatable.dart';

class Cast extends Equatable {
  final String name;
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
