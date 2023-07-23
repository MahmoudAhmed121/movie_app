  import 'package:hive_flutter/adapters.dart';
import 'package:movie_app/movies/data/model/movie_details_model.dart';

void movieDetailsBox(MovieDetailsModel data, String boxName) {
    var populerBox = Hive.box(boxName);
    populerBox.add(data);
  }