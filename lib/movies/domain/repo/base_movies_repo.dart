import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/movies/domain/entities/cast.dart';
import 'package:movie_app/movies/domain/entities/gener_home_page.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';
import 'package:movie_app/movies/domain/entities/recommendations.dart';
import 'package:movie_app/movies/domain/use_case/get_cast.dart';
import 'package:movie_app/movies/domain/use_case/get_movie_recommendations.dart';
import 'package:movie_app/movies/domain/use_case/get_movies_details.dart';
import 'package:movie_app/movies/domain/use_case/get_populer_movies.dart';

abstract class BaseMovieRepo {
  Future<Either<ServerFailure, List<Movie>>> getNowPlayingMovie();
  Future<Either<ServerFailure, List<Movie>>> getDiscoverMovie(DiscoverPrameter prameter);
  Future<Either<ServerFailure, List<Movie>>> getTopRatingMovie();
  Future<Either<ServerFailure, MovieDetails>> getMovieDetails(MovieDetailsParametrs parameter);
   Future<Either<ServerFailure, List<Recommendations>>> getRecommendations(RecommendationsParametr parameter);
   Future<Either<ServerFailure, List<Cast>>> getCast(CastParametrs parametrs);
   Future<Either<ServerFailure, List<GenresHomePage>>> getGenresHomePage();

void takeServerFailure(String error);
    
 
   
}
