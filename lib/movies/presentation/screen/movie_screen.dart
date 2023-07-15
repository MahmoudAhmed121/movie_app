import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/services/services_locator.dart';
import 'package:movie_app/movies/presentation/manager/bloc/movies_bloc.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return MoviesBloc(getIt())..add(GetNowPlayingEvent());
      },
      child: BlocConsumer<MoviesBloc, MoviesState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is MoviesSuccess) {
            return Container(
              child: const Text("data"),
            );
          }

          return const Scaffold();
        },
      ),
    );
  }
}
