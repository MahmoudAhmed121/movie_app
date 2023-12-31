import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/core/cubit/local_cubit.dart';
import 'package:movie_app/core/utils/api_service.dart';
import 'package:movie_app/movies/data/data_source/movie_local_data_source.dart';
import 'package:movie_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app/movies/data/repo/movie_repo.dart';
import 'package:movie_app/movies/domain/repo/base_movies_repo.dart';
import 'package:movie_app/movies/domain/use_case/get_cast.dart';
import 'package:movie_app/movies/domain/use_case/get_gener_home_page.dart';
import 'package:movie_app/movies/domain/use_case/get_movie_recommendations.dart';
import 'package:movie_app/movies/domain/use_case/get_movies_details.dart';
import 'package:movie_app/movies/domain/use_case/get_now_playing_movies.dart';
import 'package:movie_app/movies/domain/use_case/get_populer_movies.dart';
import 'package:movie_app/movies/domain/use_case/get_top_rating_movies.dart';
import 'package:movie_app/movies/presentation/manager/cast/cast_bloc.dart';
import 'package:movie_app/movies/presentation/manager/genres_home_page/genres_bloc.dart';
import 'package:movie_app/movies/presentation/manager/movie_details/movies_details_bloc.dart';
import 'package:movie_app/movies/presentation/manager/populer/populer_bloc.dart';
import 'package:movie_app/movies/presentation/manager/recommendation/recommendation_bloc.dart';
import 'package:movie_app/movies/presentation/manager/top_rating/top_rating_bloc.dart';

import '../../movies/presentation/manager/now_playing/now_playing_bloc.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  void init() {
    // AppTheme Cubit
    getIt.registerFactory(() => LocalCubit());
    // MovieBloc
    getIt.registerFactory(() => NowPlayingBloc(getIt()));

    getIt.registerFactory(() => PopularBloc(getIt(),));

    getIt.registerFactory(() => TopRatingBloc(getIt()));

    getIt.registerFactory(() => GenresBloc(getIt()));

    // movie details bloc

    getIt.registerFactory(() => MoviesDetailsBloc(getIt()));

    getIt.registerFactory(() => RecommendationBloc(getIt()));

    getIt.registerFactory(() => CastBloc(getIt()));

    //use cases TopRatingUseCasMovie
    getIt.registerLazySingleton(
        () => GetGenersHomePageUseCase(baseMovieRepo: getIt()));

    //use cases cast
    getIt.registerLazySingleton(() => GetCastUseCase(baseMovieRepo: getIt()));

    //use cases recommendation

    getIt.registerLazySingleton(
        () => GetRecommendationsUseCase(baseMovieRepo: getIt()));
    //use cases NowPlayingUseCaseMovie

    getIt.registerLazySingleton(
        () => GetNowPlayingUseCaseMovie(baseMovieRepo: getIt()));

    //use cases PopulerUseCasMovie

    getIt.registerLazySingleton(
        () => GetPopulerUseCasMovie(baseMovieRepo: getIt()));

    //use cases TopRatingUseCasMovie

    getIt.registerLazySingleton(
        () => GetTopRatingUseCasMovie(baseMovieRepo: getIt()));

    //use cases MovieDetailsUseCase

    getIt.registerLazySingleton(
        () => GetMovieDetailsUseCase(baseMovieRepo: getIt()));

    //Repo
    getIt.registerLazySingleton<BaseMovieRepo>(
        () => MovieRepo(basemovieRemoteDataSource: getIt(),baseLocalMovieDataSource: getIt()));
        
    // Local Data Source
     getIt.registerLazySingleton<BaseLocalMovieDataSource>(
        () => LocalMovieDataSource( ));

    // Remote Data Source
    getIt.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource(apiService: getIt()));

    // ApiServisce
    getIt.registerLazySingleton(() => ApiService(getIt()));
    
    // Dio 
    getIt.registerFactory(() => Dio());
  }
}
