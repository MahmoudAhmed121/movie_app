import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/services/services_locator.dart';
import 'package:movie_app/movies/presentation/manager/mow_playing/now_playing_bloc.dart';
import 'package:movie_app/movies/presentation/manager/mow_playing/now_playing_event.dart';
import 'package:movie_app/movies/presentation/manager/populer/populer_bloc.dart';
import 'package:movie_app/movies/presentation/manager/populer/populer_event.dart';
import 'package:movie_app/movies/presentation/manager/top_rating/top_rating_bloc.dart';
import 'package:movie_app/movies/presentation/manager/top_rating/top_rating_event.dart';
import 'package:movie_app/movies/presentation/screen/movies_screen.dart';


void main()  {
ServicesLocator().init();
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<NowPlayingBloc>()..add(GetNowPlayingEvent())),
        BlocProvider(create: (context) => getIt<PopularBloc>()..add(GetPopulerEvent())),
          BlocProvider(create: (context) => getIt<TopRatingBloc>()..add(GetTopRatingEvent()))
        
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainMoviesScreen(),
      ),
    );
  }
}
