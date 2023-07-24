  import 'package:hive_flutter/adapters.dart';

import 'package:movie_app/movies/domain/entities/movie.dart';

void nowPlayingBox(List<Movie> responseMovieModel, String boxName) {
 
  var nowPlayingBox = Hive.box<Movie>(boxName);
  nowPlayingBox.addAll(responseMovieModel);

 
  }
