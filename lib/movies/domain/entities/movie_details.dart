import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_app/movies/domain/entities/genres.dart';

part 'movie_details.g.dart';

@HiveType(typeId: 1)
class MovieDetails extends Equatable {
  @HiveField(0)
  final String homePage;
  @HiveField(1)
  final String overview;
  @HiveField(2)
  final String backdropPath;
 @HiveField(3)
  final String releaseDate;
  @HiveField(4)
  final num voteAverage;
  @HiveField(5)
  final int id;
  @HiveField(6)
  final String title;
 @HiveField(7)
  final int runtime;
  @HiveField(8)
  final List<Genres> genres;

  const MovieDetails({
    required this.homePage,
    required this.overview,
    required this.backdropPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.id,
    required this.title,
    required this.runtime,
    required this.genres,
  });

  @override
  List<Object> get props {
    return [
      overview,
      backdropPath,
      releaseDate,
      voteAverage,
      id,
      title,
      runtime,
      genres
    ];
  }
}
