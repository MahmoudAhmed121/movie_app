import 'package:movie_app/movies/domain/entities/cast.dart';

class CastModel extends Cast {
  const CastModel({required super.name, required super.photo});

  factory CastModel.fromjson(Map<String, dynamic> json) {
    return CastModel(
      name: json["name"] ,
      photo: json["profile_path"] ?? "/xXCY9arkK2JzoetYFLGkt6tN7dX.jpg",
    );
  }
}
