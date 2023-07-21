import 'package:movie_app/movies/data/model/generis_model.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.homePage,
    required super.overview,
    required super.backdropPath,
    required super.releaseDate,
    required super.voteAverage,
    required super.id,
    required super.title,
    required super.runtime,
    required super.genres,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      homePage: json["homepage"],
      overview: json["overview"],
      backdropPath: json["backdrop_path"],
      releaseDate: json["release_date"],
      voteAverage: json["vote_average"].toDouble(),
      id: json["id"],
      title: json["title"],
      runtime: json["runtime"],
      genres: List.from(json["genres"])
          .map((e) => GenerisModel.fromJson(e))
          .toList(),
    );
  }
}
