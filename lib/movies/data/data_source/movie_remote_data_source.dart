import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/constant.dart';
import 'package:movie_app/movies/data/model/movie_model.dart';

class MovieRemoteDataSource{

Future< List<MovieModel>?> getNowPlayingMovie()async{
  try {
  final response =await Dio().get("${AppConstant.domain}/movie/${AppConstant.nowPlaying}?api_key=${AppConstant.apiKey}");

  final List<dynamic> responseDynamic = response.data["results"];
  final List<MovieModel> responseMovieModel = responseDynamic.map((dataList) => MovieModel.fromjson(dataList)).toList();

return responseMovieModel;

} on Exception catch (e) {
  debugPrint("my error is ${e.toString()}");
return null;
}



}

}