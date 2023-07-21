import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/services/services_locator.dart';
import 'package:movie_app/movies/presentation/commponent/movie_details_content.dart';
import 'package:movie_app/movies/presentation/manager/cast/cast_bloc.dart';
import 'package:movie_app/movies/presentation/manager/cast/cast_event.dart';
import 'package:movie_app/movies/presentation/manager/movie_details/movies_details_bloc.dart';
import 'package:movie_app/movies/presentation/manager/movie_details/movies_details_event.dart';
import 'package:movie_app/movies/presentation/manager/recommendation/recommendation_bloc.dart';
import 'package:movie_app/movies/presentation/manager/recommendation/recommendation_event.dart';

class MovieDetailScreen extends StatelessWidget {
  final int id;

  const MovieDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                getIt<MoviesDetailsBloc>()..add(GetMovieDetailsEvent(id: id))),
        BlocProvider(
            create: (context) => getIt<RecommendationBloc>()
              ..add(GetRecommendationsEvent(id: id))),

               BlocProvider(
            create: (context) => getIt<CastBloc>()
              ..add(GetCastEvent(id: id))),
      ],
      child: const Scaffold(
        body: MovieDetailContent(),
      ),
    );
  }
}

