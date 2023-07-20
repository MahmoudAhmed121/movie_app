import 'package:movie_app/movies/domain/entities/recommendations.dart';

class RecommendationModel extends Recommendations {
  const RecommendationModel({super.backdropPath, required super.id});

  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
      backdropPath: json["backdrop_path"] ?? "/oqP1qEZccq5AD9TVTIaO6IGUj7o.jpg",
      id: json["id"],
    );
  }
}
