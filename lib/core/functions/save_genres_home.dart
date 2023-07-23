import 'package:hive_flutter/adapters.dart';
import 'package:movie_app/movies/domain/entities/gener_home_page.dart';

void genresBox(List<GenresHomePage> generisHome, String boxName) {
    var generisHomeBox = Hive.box(boxName);

    generisHomeBox.addAll(generisHome);
  }
