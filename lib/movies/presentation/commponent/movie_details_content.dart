import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movies/presentation/commponent/cast_view.dart';
import 'package:movie_app/movies/presentation/commponent/more_like_component.dart';
import 'package:movie_app/movies/presentation/commponent/recommendation_component.dart';
import 'package:movie_app/movies/presentation/commponent/sliver_app_bar.dart';
import 'package:movie_app/movies/presentation/commponent/title_movie.dart';
import 'package:movie_app/movies/presentation/manager/movie_details/movies_details_bloc.dart';

import '../manager/movie_details/movies_details_state.dart';

class MovieDetailContent extends StatelessWidget {
  const MovieDetailContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoviesDetailsBloc, MoviesDetailsState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is MoviesDetailsSuccess) {
          return CustomScrollView(
            key: const Key('movieDetailScrollView'),
            slivers: [
              CustomAppBar(movieDetails: state.movieDetails),
              CustomTiltleMove(movieDetails: state.movieDetails),
              const CustomCastView(),
              const CustomMoreLikeThisMovie(),
              const RecommendationsWidget(),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}

