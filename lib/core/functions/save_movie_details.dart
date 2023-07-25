  import 'package:hive_flutter/adapters.dart';

import 'package:movie_app/movies/domain/entities/movie_details.dart';

void movieDetailsBox(MovieDetails data, String boxName) {
  var movieDetailsBox = Hive.box<MovieDetails>(boxName);
  movieDetailsBox.put(0, data); // Assuming you want to store the data at index 0
}

