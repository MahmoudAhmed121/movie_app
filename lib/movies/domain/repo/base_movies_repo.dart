import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';

abstract class BaseMovieRepo {
Future<Either<ServerFailure, Future<List<Movie>>>> getNowPlayingMovie();
  Future<Either<ServerFailure, Future<List<Movie>>>> getPopulerMovie();
  Future<Either<ServerFailure, Future<List<Movie>>>> getTopRatingMovie();
  
}
