import 'package:hive_flutter/adapters.dart';
import 'package:movie_app/core/utils/constant.dart';
import 'package:movie_app/movies/domain/entities/cast.dart';
import 'package:movie_app/movies/domain/entities/gener_home_page.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';
import 'package:movie_app/movies/domain/entities/recommendations.dart';


abstract class BaseLocalMovieDataSource {
  List<Movie> getNowPlayingMovie();
  List<Movie> getDiscaverMovie();
  List<Movie> getTopRatingMovie();
  MovieDetails getMovieDetails();
  List<Recommendations> getRecommendations();
  List<Cast> getCast();
  List<GenresHomePage> getGenresHomePage();
}

class LocalMovieDataSource extends BaseLocalMovieDataSource {
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
  MovieDetails getMovieDetails() {
     var movieDetailsBox = Hive.box<MovieDetails>(kMovieDetailsBox);
  
    return movieDetailsBox.get(0)!;
  }

  @override
  List<Movie> getNowPlayingMovie() {
    var box = Hive.box<Movie>(kNowPlayingBox);
    return box.values.toList();
  }

  @override
  List<Recommendations> getRecommendations() {
    var box = Hive.box<Recommendations>(kRecommendationBox);
    return box.values.toList();
  }

  @override
  List<Movie> getTopRatingMovie() {
    var box = Hive.box<Movie>(kTopRatingBox);
    return box.values.toList();
  }
}
