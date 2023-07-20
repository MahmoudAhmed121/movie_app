class ApiConstant {
  static const String domain = "https://api.themoviedb.org/3";
  static const String apiKey = "?api_key=992e2fd71b1daca0c72978cd45a84073";
  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";
  static const String popular = "/movie/popular";
  static const String nowPlaying = "/movie/now_playing";
  static const String topRated = "/movie/top_rated";
  static String recommendation(String id) =>
      "/movie/$id/recommendations$apiKey";
  static String cast(String id) => "/movie/$id/credits$apiKey";
  static String imageUrl(String path) => "$baseImageUrl$path";
}
