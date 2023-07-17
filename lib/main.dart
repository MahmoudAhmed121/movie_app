import 'package:flutter/material.dart';
import 'package:movie_app/core/services/services_locator.dart';
import 'package:movie_app/movies/presentation/screen/movies_screen.dart';


void main()  {
ServicesLocator().init();
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainMoviesScreen(),
    );
  }
}
