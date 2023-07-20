import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/utils/base_use_case.dart';
import 'package:movie_app/movies/domain/entities/recommendations.dart';
import 'package:movie_app/movies/domain/repo/base_movies_repo.dart';

class GetRecommendationsUseCase
    extends BaseUseCase<List<Recommendations>, RecommendationsParametr> {
  BaseMovieRepo baseMovieRepo;

  GetRecommendationsUseCase({required this.baseMovieRepo});

  @override
  Future<Either<ServerFailure, List<Recommendations>>> call(
      RecommendationsParametr parametrs) {
    return baseMovieRepo.getRecommendations(parametrs);
  }
}

class RecommendationsParametr extends Equatable {
  final int id;
  const RecommendationsParametr({required this.id});

  @override
  List<Object?> get props => [];
}
