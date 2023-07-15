import 'package:dartz/dartz.dart';

import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/repo/base_movies_repo.dart';

class MovieRepo implements BaseMovieRepo {
  BaseMovieRemoteDataSource basemovieRemoteDataSource;
  MovieRepo({
    required this.basemovieRemoteDataSource,
  });

  @override
  Future<Either<ServerFailure, List<Movie>>> getNowPlayingMovie() async {
    final response = await basemovieRemoteDataSource.getNowPlayingMovie();
    return response;
  }

  @override
  Future<Either<ServerFailure, List<Movie>>> getPopulerMovie() async{
    final response = await basemovieRemoteDataSource.getPopulerMovie();
    return response;
  }

  @override
  Future<Either<ServerFailure, List<Movie>>> getTopRatingMovie()async {
  final response= await basemovieRemoteDataSource.getTopRatingMovie();
  return response;
  }
}
