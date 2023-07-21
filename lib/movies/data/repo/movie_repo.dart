import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app/movies/domain/entities/cast.dart';
import 'package:movie_app/movies/domain/entities/gener_home_page.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';
import 'package:movie_app/movies/domain/entities/recommendations.dart';
import 'package:movie_app/movies/domain/repo/base_movies_repo.dart';
import 'package:movie_app/movies/domain/use_case/get_cast.dart';
import 'package:movie_app/movies/domain/use_case/get_movie_recommendations.dart';
import 'package:movie_app/movies/domain/use_case/get_movies_details.dart';

class MovieRepo extends BaseMovieRepo {
  BaseMovieRemoteDataSource basemovieRemoteDataSource;
  MovieRepo({
    required this.basemovieRemoteDataSource,
  });

  @override
  Future<Either<ServerFailure, List<Movie>>> getNowPlayingMovie() async {
    try {
      final response = await basemovieRemoteDataSource.getNowPlayingMovie();
      return Right(response);
    } on DioError catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<ServerFailure, List<Movie>>> getPopulerMovie() async {
    try {
      final response = await basemovieRemoteDataSource.getPopulerMovie();
      return Right(response);
    } on DioError catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<ServerFailure, List<Movie>>> getTopRatingMovie() async {
    try {
      final response = await basemovieRemoteDataSource.getTopRatingMovie();
      return Right(response);
    } on DioError catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<ServerFailure, MovieDetails>> getMovieDetails(
      MovieDetailsParametrs parameter) async {
    try {
      final response =
          await basemovieRemoteDataSource.getMovieDetails(parameter);
      return Right(response);
    } on DioError catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<ServerFailure, List<Recommendations>>> getRecommendations(
      RecommendationsParametr parameter) async {
    try {
      final response =
          await basemovieRemoteDataSource.getRecommendations(parameter);

      return Right(response);
    } on DioError catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<ServerFailure, List<Cast>>> getCast(
      CastParametrs parametrs) async {
    try {
      final response = await basemovieRemoteDataSource.getCast(parametrs);

      return Right(response);
    } on DioError catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<ServerFailure, List<GenresHomePage>>>
      getGenresHomePage() async {
    try {
      final response = await basemovieRemoteDataSource.getGenresHomePage();
      return Right(response.cast<GenresHomePage>());
    } on DioError catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
  }
}
