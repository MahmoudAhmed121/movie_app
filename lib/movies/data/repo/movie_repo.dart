// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/movies/data/data_source/movie_local_data_source.dart';
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
import 'package:movie_app/movies/domain/use_case/get_populer_movies.dart';

String errorMessage = "";


class MovieRepo extends BaseMovieRepo {
  BaseMovieRemoteDataSource basemovieRemoteDataSource;
  BaseLocalMovieDataSource baseLocalMovieDataSource;
  MovieRepo({
    required this.basemovieRemoteDataSource,
    required this.baseLocalMovieDataSource,
  });

  @override
  Future<Either<ServerFailure, List<Movie>>> getNowPlayingMovie() async {
    try {
      var responseLocal = baseLocalMovieDataSource.getNowPlayingMovie();
      if (responseLocal.isNotEmpty) {
        return Right(responseLocal);
      }
      final response = await basemovieRemoteDataSource.getNowPlayingMovie();
      return right(response);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<ServerFailure, List<Movie>>> getDiscoverMovie(
      DiscoverPrameter parameter) async {
    try {
      final response =
          await basemovieRemoteDataSource.getDiscaverMovie(parameter);

      return right(response);
    } on DioException catch (e) {
      final responseLocal = baseLocalMovieDataSource.getDiscaverMovie();
      if (responseLocal.isNotEmpty) {
        takeServerFailure(ServerFailure.fromDioError(e).errMessages);

        return right(responseLocal);
      }
      return left(ServerFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<ServerFailure, List<Movie>>> getTopRatingMovie() async {
    try {
      final response = await basemovieRemoteDataSource.getTopRatingMovie();

      return right(response);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<ServerFailure, MovieDetails>> getMovieDetails(
      MovieDetailsParametrs parameter) async {
    try {
      final response =
          await basemovieRemoteDataSource.getMovieDetails(parameter);
     

      return right(response);
    } on DioException catch (e) {
      var responseLocal = baseLocalMovieDataSource.getMovieDetails();

      if (responseLocal.genres.isNotEmpty) {
        return right(responseLocal);
      }
      return left(ServerFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<ServerFailure, List<Recommendations>>> getRecommendations(
      RecommendationsParametr parameter) async {
    try {
      final response =
          await basemovieRemoteDataSource.getRecommendations(parameter);

      return right(response);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<ServerFailure, List<Cast>>> getCast(
      CastParametrs parametrs) async {
    try {
      final response = await basemovieRemoteDataSource.getCast(parametrs);

      return right(response);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<ServerFailure, List<GenresHomePage>>>
      getGenresHomePage() async {
    try {
      final response = await basemovieRemoteDataSource.getGenresHomePage();
      return right(response);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    }
  }

  @override
  void takeServerFailure(String error) {
    errorMessage = error;
  }


}
