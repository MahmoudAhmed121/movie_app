// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/utils/base_use_case.dart';
import 'package:movie_app/movies/domain/entities/gener_home_page.dart';
import 'package:movie_app/movies/domain/repo/base_movies_repo.dart';

class GetGenersHomePageUseCase
    extends BaseUseCase<List<GenresHomePage>, NoParametrs> {
  BaseMovieRepo baseMovieRepo;
  GetGenersHomePageUseCase({
    required this.baseMovieRepo,
  });
  @override
  Future<Either<ServerFailure, List<GenresHomePage>>> call(NoParametrs parametrs) {

    return baseMovieRepo.getGenresHomePage();
  }
}
