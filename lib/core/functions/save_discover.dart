 import 'package:hive_flutter/adapters.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';

void discoverBox(List<Movie> responseMovieModel, String boxName) {
    var discoverBox = Hive.box(boxName);
    discoverBox.addAll(responseMovieModel);
  }