// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:movie_app/core/functions/save_cast.dart';
import 'package:movie_app/core/functions/save_discover.dart';
import 'package:movie_app/core/functions/save_genres_home.dart';
import 'package:movie_app/core/functions/save_movie_details.dart';
import 'package:movie_app/core/functions/save_now_playing.dart';
import 'package:movie_app/core/functions/save_recommendations.dart';
import 'package:movie_app/core/functions/save_top_rating.dart';
import 'package:movie_app/core/utils/api_constant.dart';
import 'package:movie_app/core/utils/api_service.dart';
import 'package:movie_app/core/utils/constant.dart';
import 'package:movie_app/movies/data/model/cast_model.dart';
import 'package:movie_app/movies/data/model/genres_home_page.dart';
import 'package:movie_app/movies/data/model/movie_details_model.dart';
import 'package:movie_app/movies/data/model/movie_model.dart';
import 'package:movie_app/movies/data/model/recommendations_model.dart';
import 'package:movie_app/movies/domain/entities/gener_home_page.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';
import 'package:movie_app/movies/domain/entities/recommendations.dart';
import 'package:movie_app/movies/domain/use_case/get_cast.dart';
import 'package:movie_app/movies/domain/use_case/get_movie_recommendations.dart';
import 'package:movie_app/movies/domain/use_case/get_movies_details.dart';
import 'package:movie_app/movies/domain/use_case/get_populer_movies.dart';

import '../../domain/entities/cast.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<Movie>> getNowPlayingMovie();
  Future<List<Movie>> getDiscaverMovie(DiscoverPrameter prameter);
  Future<List<Movie>> getTopRatingMovie();
  Future<MovieDetails> getMovieDetails(MovieDetailsParametrs parametrs);
  Future<List<Recommendations>> getRecommendations(
      RecommendationsParametr parametrs);
  Future<List<Cast>> getCast(CastParametrs parametrs);
  Future<List<GenresHomePage>> getGenresHomePage();
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  ApiService apiService;
  MovieRemoteDataSource({
    required this.apiService,
  });

  @override
  Future<List<MovieModel>> getNowPlayingMovie() async {
    final response = await apiService.get(
        endpoint: ApiConstant.nowPlaying + ApiConstant.apiKey);

    final List<dynamic> responseDynamic = response["results"];
    final List<MovieModel> responseMovieModel = responseDynamic
        .map((dataList) => MovieModel.fromjson(dataList))
        .toList();
    nowPlayingBox(responseMovieModel, kNowPlayingBox);
    return responseMovieModel;
  }

  @override
  Future<List<MovieModel>> getDiscaverMovie(DiscoverPrameter prameter) async {
    final response = await apiService.get(
        endpoint: ApiConstant.discover(prameter.id.toString()));
    final List<dynamic> responseDynamic = response["results"];
    final List<MovieModel> responseMovieModel = responseDynamic
        .map((dataList) => MovieModel.fromjson(dataList))
        .toList();
    discoverBox(responseMovieModel, kDiscoverBox);
    return responseMovieModel;
  }

  @override
  Future<List<MovieModel>> getTopRatingMovie() async {
    final response = await apiService.get(
        endpoint: ApiConstant.topRated + ApiConstant.apiKey);

    final List<dynamic> responseDynamic = response["results"];
    final List<MovieModel> responseMovieModel = responseDynamic
        .map((dataList) => MovieModel.fromjson(dataList))
        .toList();
    topRatingBox(responseMovieModel, kTopRatingBox);
    return responseMovieModel;
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsParametrs parametrs) async {
    final response = await apiService.get(
        endpoint: "/movie/${parametrs.id}${ApiConstant.apiKey}");

    final data = MovieDetailsModel.fromJson(response);
    movieDetailsBox(data, kMovieDetailsBox);
    return data;
  }

  @override
  Future<List<RecommendationModel>> getRecommendations(
      RecommendationsParametr parametrs) async {
    final response = await apiService.get(
        endpoint: ApiConstant.recommendation(parametrs.id.toString()));

    final List<dynamic> responseDynamic = response["results"];

    final List<RecommendationModel> responseRecommendation =
        responseDynamic.map((e) => RecommendationModel.fromJson(e)).toList();
    recomendationBox(responseRecommendation, kRecommendationBox);
    return responseRecommendation;
  }

  @override
  Future<List<CastModel>> getCast(CastParametrs parametrs) async {
    final response = await apiService.get(
        endpoint: ApiConstant.cast(parametrs.id.toString()));

    final List<dynamic> responseDynamic = response["cast"];

    final List<CastModel> responseCast =
        responseDynamic.map((e) => CastModel.fromjson(e)).toList();
    castBox(responseCast, kCastBox);
    return responseCast;
  }

  @override
  Future<List<GenerisHomePageModel>> getGenresHomePage() async {
    final response =
        await apiService.get(endpoint: ApiConstant.genner + ApiConstant.apiKey);

    final List<dynamic> responseDynamic = response["genres"];
    final List<GenerisHomePageModel> responseGenner =
        responseDynamic.map((e) => GenerisHomePageModel.fromJson(e)).toList();
    genresBox(responseGenner, kGenerHomeBox);
    return responseGenner;
  }
}
