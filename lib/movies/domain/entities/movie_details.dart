
import 'package:equatable/equatable.dart';
import 'package:movie_app/movies/domain/entities/genres.dart';

class MovieDetails extends Equatable {


  final String homePage;
  final String overview;
  final String backdropPath;
  final String releaseDate;
  final num voteAverage;
  final int id;
  final String title;
  final int runtime;
  final List<Genres> genres;

 const MovieDetails( {
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
