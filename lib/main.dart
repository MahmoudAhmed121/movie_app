import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/cubit/local_cubit.dart';
import 'package:movie_app/core/cubit/local_state.dart';
import 'package:movie_app/core/services/services_locator.dart';
import 'package:movie_app/core/theme/app_theme.dart';
import 'package:movie_app/core/theme/enum_theme.dart';
import 'package:movie_app/movies/presentation/manager/genres_home_page/genres_bloc.dart';
import 'package:movie_app/movies/presentation/manager/genres_home_page/genres_event.dart';
import 'package:movie_app/movies/presentation/manager/populer/populer_bloc.dart';
import 'package:movie_app/movies/presentation/manager/populer/populer_event.dart';
import 'package:movie_app/movies/presentation/manager/top_rating/top_rating_bloc.dart';
import 'package:movie_app/movies/presentation/manager/top_rating/top_rating_event.dart';
import 'package:movie_app/splach/presentation/splach_view.dart';

import 'movies/presentation/manager/now_playing/now_playing_bloc.dart';
import 'movies/presentation/manager/now_playing/now_playing_event.dart';

void main() {
  ServicesLocator().init();
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
                getIt<PopularBloc>()..add(const GetPopulerEvent(id: 80))),
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
