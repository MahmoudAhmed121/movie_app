import 'package:movie_app/movies/domain/entities/gener_home_page.dart';

class GenerisHomePageModel extends GenresHomePage {
  const GenerisHomePageModel({required super.name, required super.id});

  factory GenerisHomePageModel.fromJson(Map<String, dynamic> json) {
    return GenerisHomePageModel(
      name: json["name"],
      id: json["id"],
    );
  }
}
