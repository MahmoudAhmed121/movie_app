import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final List<int> genreIds;
  final String overview;
  final double voteAverage;
  final double releaseData;

 const Movie( {
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.genreIds,
    required this.overview,
    required this.voteAverage,
    required this.releaseData,
  });

  @override
  List<Object> get props {
    return [
      id,
      title,
      backdropPath,
      genreIds,
      overview,
      voteAverage,
      releaseData
    ];
  }
}
