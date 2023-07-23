import 'package:hive_flutter/adapters.dart';
import 'package:movie_app/core/utils/constant.dart';
import 'package:movie_app/movies/domain/entities/cast.dart';
import 'package:movie_app/movies/domain/entities/gener_home_page.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';
import 'package:movie_app/movies/domain/entities/recommendations.dart';

abstract class BaseLocalDataSource {
  List<Movie> getNowPlayingMovie();
  List<Movie> getDiscaverMovie();
  List<Movie> getTopRatingMovie();
    Box<MovieDetails> getMovieDetails();
  List<Recommendations> getRecommendations();
  List<Cast> getCast();
  List<GenresHomePage> getGenresHomePage();
}


class LocalDataSource extends BaseLocalDataSource{
  @override
  List<Cast> getCast() {
   var box = Hive.box<Cast>(kCastBox);
   return box.values.toList();
  }

  @override
  List<Movie> getDiscaverMovie() {
  var box = Hive.box<Movie>(kDiscoverBox);
   return box.values.toList();
  }

  @override
  List<GenresHomePage> getGenresHomePage() {
    var box = Hive.box<GenresHomePage>(kGenerHomeBox);
   return box.values.toList();
  }

@override
Box<MovieDetails> getMovieDetails() {
  var box = Hive.box<MovieDetails>(kMovieDetailsBox);
  return box;
}

  @override
  List<Movie> getNowPlayingMovie() {
    // TODO: implement getNowPlayingMovie
    throw UnimplementedError();
  }

  @override
  List<Recommendations> getRecommendations() {
    // TODO: implement getRecommendations
    throw UnimplementedError();
  }

  @override
  List<Movie> getTopRatingMovie() {
    // TODO: implement getTopRatingMovie
    throw UnimplementedError();
  }
}