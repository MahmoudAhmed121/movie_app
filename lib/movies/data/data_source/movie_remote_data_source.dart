import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/utils/constant.dart';
import 'package:movie_app/movies/data/model/movie_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<Either<ServerFailure, List<MovieModel>>> getNowPlayingMovie();
  Future<Either<ServerFailure, List<MovieModel>>> getPopulerMovie();
  Future<Either<ServerFailure, List<MovieModel>>> getTopRatingMovie();
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<Either<ServerFailure, List<MovieModel>>> getNowPlayingMovie() async {
    try {
      final response = await Dio().get(
          "${ApiConstant.domain}${ApiConstant.nowPlaying}${ApiConstant.apiKey}");

      final List<dynamic> responseDynamic = response.data["results"];
      final List<MovieModel> responseMovieModel = responseDynamic
          .map((dataList) => MovieModel.fromjson(dataList))
          .toList();

      return Right(responseMovieModel);
    } on DioError catch (e) {
     
      return Left(
          ServerFailure.fromResponse(e.response!.statusCode, e.response!.data));
    }
  }

  @override
  Future<Either<ServerFailure, List<MovieModel>>> getPopulerMovie() async {
    try {
      final response = await Dio().get(
          "${ApiConstant.domain}${ApiConstant.popular}${ApiConstant.apiKey}");

      final List<dynamic> responseDynamic = response.data["results"];
      final List<MovieModel> responseMovieModel = responseDynamic
          .map((dataList) => MovieModel.fromjson(dataList))
          .toList();

      return Right(responseMovieModel);
    } on DioError catch (e) {
      debugPrint("my error is ${e.toString()}");
      return Left(
          ServerFailure.fromResponse(e.response!.statusCode, e.response!.data));
    }
  }

  @override
  Future<Either<ServerFailure, List<MovieModel>>> getTopRatingMovie() async {
    try {
      final response = await Dio().get(
          "${ApiConstant.domain}${ApiConstant.topRated}${ApiConstant.apiKey}");

      final List<dynamic> responseDynamic = response.data["results"];
      final List<MovieModel> responseMovieModel = responseDynamic
          .map((dataList) => MovieModel.fromjson(dataList))
          .toList();

      return Right(responseMovieModel);
    } on DioError catch (e) {
      debugPrint("my error is ${e.toString()}");
      return Left(
          ServerFailure.fromResponse(e.response!.statusCode, e.response!.data));
    }
  }


}
