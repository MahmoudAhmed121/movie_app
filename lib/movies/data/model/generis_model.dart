import 'package:movie_app/movies/domain/entities/genres.dart';

class GenerisModel extends Genres {
  const GenerisModel({required super.name, required super.id});

  factory GenerisModel.fromJson(Map<String, dynamic> json) {
    return GenerisModel(
      name: json["name"],
      id: json["id"],
    );
  }
}
