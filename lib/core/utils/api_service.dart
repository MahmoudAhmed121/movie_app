import 'package:dio/dio.dart';


class ApiService {
  final Dio _dio;
  static const String domain = "https://api.themoviedb.org/3";
  
  ApiService(
    this._dio,
  );

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    final response = await _dio.get("$domain$endpoint");
    return response.data;
  }

  Future<Map<String, dynamic>> post(String endpoint) async {
    final response = await _dio.post(domain);

    return response.data;
  }

  Future<Map<String, dynamic>> put(String endpoint) async {
    final response = await _dio.put(domain);

    return response.data;
  }
}
