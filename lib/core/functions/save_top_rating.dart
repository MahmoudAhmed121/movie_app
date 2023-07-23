  import 'package:hive_flutter/adapters.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';

void topRatingBox(List<Movie> responseMovieModel, String boxName) {
    var topRatingBox = Hive.box(boxName);
    topRatingBox.addAll(responseMovieModel);
  }