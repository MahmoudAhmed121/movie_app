import 'package:get_it/get_it.dart';
import 'package:movie_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app/movies/data/repo/movie_repo.dart';
import 'package:movie_app/movies/domain/repo/base_movies_repo.dart';
import 'package:movie_app/movies/domain/use_case/get_now_playing_movies.dart';
final getIt = GetIt.instance;

class ServicesLocator{


void init(){
//use cases
getIt.registerLazySingleton(() => GetNowPlayingUseCaseMovie(baseMovieRepo: getIt()));

//Repo
getIt.registerLazySingleton<BaseMovieRepo>(() => MovieRepo(basemovieRemoteDataSource: getIt()));


  // DataSource
getIt.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
   
}
}