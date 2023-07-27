  import 'package:hive_flutter/adapters.dart';
import 'package:movie_app/movies/domain/entities/recommendations.dart';

void recomendationBox(
      List<Recommendations> responseRecommendation, String boxName) {
    var recomendationBox = Hive.box<Recommendations>(boxName);
    recomendationBox.addAll(responseRecommendation);
  }