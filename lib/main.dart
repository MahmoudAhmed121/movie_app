import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_app/core/cubit/local_cubit.dart';
import 'package:movie_app/core/cubit/local_state.dart';
import 'package:movie_app/core/services/services_locator.dart';
import 'package:movie_app/core/theme/app_theme.dart';
import 'package:movie_app/core/theme/enum_theme.dart';
import 'package:movie_app/core/utils/constant.dart';
import 'package:movie_app/movies/domain/entities/gener_home_page.dart';
import 'package:movie_app/movies/domain/entities/genres.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';
import 'package:movie_app/movies/domain/entities/recommendations.dart';
import 'package:movie_app/movies/presentation/manager/genres_home_page/genres_bloc.dart';
import 'package:movie_app/movies/presentation/manager/genres_home_page/genres_event.dart';
import 'package:movie_app/movies/presentation/manager/populer/populer_bloc.dart';
import 'package:movie_app/movies/presentation/manager/populer/populer_event.dart';
import 'package:movie_app/movies/presentation/manager/top_rating/top_rating_bloc.dart';
import 'package:movie_app/movies/presentation/manager/top_rating/top_rating_event.dart';
import 'package:movie_app/splach/presentation/splach_view.dart';

import 'movies/presentation/manager/now_playing/now_playing_bloc.dart';
import 'movies/presentation/manager/now_playing/now_playing_event.dart';

void main() async {
 ServicesLocator().init();
await Hive.initFlutter();
Hive.registerAdapter(MovieAdapter());
Hive.registerAdapter(MovieDetailsAdapter());
Hive.registerAdapter(GenresAdapter());
Hive.registerAdapter(RecommendationsAdapter());
Hive.registerAdapter(GenresHomePageAdapter());
await Hive.openBox<Movie>(kNowPlayingBox);
await Hive.openBox<Movie>(kDiscoverBox);
await Hive.openBox<Movie>(kTopRatingBox);
await Hive.openBox<MovieDetails>(kMovieDetailsBox);
await Hive.openBox<Recommendations>(kRecommendationBox);
await Hive.openBox<GenresHomePage>(kGenerHomeBox);

  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                getIt<NowPlayingBloc>()..add(GetNowPlayingEvent())),
        BlocProvider(
            create: (context) =>
                getIt<PopularBloc>()..add(  const GetPopulerEvent(id: 80))),
        BlocProvider(
            create: (context) =>
                getIt<TopRatingBloc>()..add(GetTopRatingEvent())),
        BlocProvider(
            create: (context) =>
                getIt<GenresBloc>()..add(GetGenresHomePageEvent())),
        BlocProvider(
            create: (context) => getIt<LocalCubit>()
              ..changeTheme(
                ThemeState.initial,
              )),
      ],
      child: BlocBuilder<LocalCubit, LocalState>(
        builder: (context, state) {
          return BlocBuilder<LocalCubit, LocalState>(
            builder: (context, state) {
              if (state is AppLightTheme) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: CustomTheme.lightTheme(context),
                  home: const SplachView(),
                );
              } else if (state is AppDarkTheme) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: CustomTheme.darkTheme(context),
                  home: const SplachView(),
                );
              }
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData.dark().copyWith(
                  scaffoldBackgroundColor: const Color(0xff16122B),
                ),
                home: const SplachView(),
              );
            },
          );
        },
      ),
    );
  }
}
