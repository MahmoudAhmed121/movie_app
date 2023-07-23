 import 'package:hive_flutter/adapters.dart';
import 'package:movie_app/movies/domain/entities/cast.dart';

void castBox(List<Cast> responseCast, String boxName) {
    var castBox = Hive.box(boxName);

    castBox.addAll(responseCast);
  }