  import 'package:hive_flutter/adapters.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';

void movieDetailsBox(MovieDetails data, String boxName) {
    var populerBox = Hive.box(boxName);
    populerBox.add(data);
  }