import 'package:dio/dio.dart';
import 'package:movie_app/core/services/services_locator.dart';
import 'package:movie_app/core/utils/constant.dart';
import 'package:movie_app/movies/data/model/cast_model.dart';
import 'package:movie_app/movies/data/model/genres_home_page.dart';
import 'package:movie_app/movies/data/model/movie_details_model.dart';
import 'package:movie_app/movies/data/model/movie_model.dart';
import 'package:movie_app/movies/data/model/recommendations_model.dart';
import 'package:movie_app/movies/domain/use_case/get_cast.dart';
import 'package:movie_app/movies/domain/use_case/get_movie_recommendations.dart';
import 'package:movie_app/movies/domain/use_case/get_movies_details.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovie();
  Future<List<MovieModel>> getPopulerMovie();
  Future<List<MovieModel>> getTopRatingMovie();
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParametrs parametrs);
  Future<List<RecommendationModel>> getRecommendations(RecommendationsParametr parametrs);
  Future<List<CastModel>> getCast(CastParametrs parametrs);
  Future<List<GenerisHomePageModel>> getGenresHomePage();
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovie() async {
    final response = await getIt<Dio>().get(
        "${ApiConstant.domain}${ApiConstant.nowPlaying}${ApiConstant.apiKey}");

    final List<dynamic> responseDynamic = response.data["results"];
    final List<MovieModel> responseMovieModel = responseDynamic
        .map((dataList) => MovieModel.fromjson(dataList))
        .toList();

    return responseMovieModel;
  }

  @override
  Future<List<MovieModel>> getPopulerMovie() async {
    final response = await getIt<Dio>().get(
        "${ApiConstant.domain}${ApiConstant.popular}${ApiConstant.apiKey}");

    final List<dynamic> responseDynamic = response.data["results"];
    final List<MovieModel> responseMovieModel = responseDynamic
        .map((dataList) => MovieModel.fromjson(dataList))
        .toList();

    return responseMovieModel;
  }

  @override
  Future<List<MovieModel>> getTopRatingMovie() async {
    final response = await getIt<Dio>().get(
        "${ApiConstant.domain}${ApiConstant.topRated}${ApiConstant.apiKey}");

    final List<dynamic> responseDynamic = response.data["results"];
    final List<MovieModel> responseMovieModel = responseDynamic
        .map((dataList) => MovieModel.fromjson(dataList))
        .toList();

    return responseMovieModel;
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParametrs parametrs) async {
    final response = await getIt<Dio>().get(
        "${ApiConstant.domain}/movie/${parametrs.id}${ApiConstant.apiKey}");
    final data = MovieDetailsModel.fromJson(response.data);

    return data;
  }

  @override
  Future<List<RecommendationModel>> getRecommendations(
      RecommendationsParametr parametrs) async {
    final response = await getIt<Dio>().get(
        "${ApiConstant.domain}${ApiConstant.recommendation(parametrs.id.toString())}");

    final List<dynamic> responseDynamic = response.data["results"];

    final List<RecommendationModel> responseRecommendation =
        responseDynamic.map((e) => RecommendationModel.fromJson(e)).toList();

    return responseRecommendation;
  }

  @override
  Future<List<CastModel>> getCast(CastParametrs parametrs) async {
    final response = await getIt<Dio>().get(
        "${ApiConstant.domain}${ApiConstant.cast(parametrs.id.toString())}");

    final List<dynamic> responseDynamic = response.data["cast"];

    final List<CastModel> responseCast =
        responseDynamic.map((e) => CastModel.fromjson(e)).toList();

    return responseCast;
  }

  @override
  Future<List<GenerisHomePageModel>> getGenresHomePage() async {
    final response = await getIt<Dio>()
        .get("${ApiConstant.domain}${ApiConstant.genner}${ApiConstant.apiKey}");

    final List<dynamic> responseDynamic = response.data["genres"];
    final List<GenerisHomePageModel> responseGenner =
        responseDynamic.map((e) => GenerisHomePageModel.fromJson(e)).toList();

    return responseGenner;
  }
}
