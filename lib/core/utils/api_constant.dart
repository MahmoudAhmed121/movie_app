
class ApiConstant {
  
  static const String apiKey = "?api_key=992e2fd71b1daca0c72978cd45a84073";
  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";

  static const String nowPlaying = "/movie/now_playing";
  static const String topRated = "/movie/top_rated";
  static const String genner = "/genre/movie/list";
  static String recommendation(String id) =>
      "/movie/$id/recommendations$apiKey";
  static String discover(String id) =>
      "/discover/movie?with_genres=$id&api_key=992e2fd71b1daca0c72978cd45a84073";
  static String cast(String id) => "/movie/$id/credits$apiKey";
  static String imageUrl(String path) => "$baseImageUrl$path";
}

