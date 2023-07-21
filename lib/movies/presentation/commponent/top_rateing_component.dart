import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/constant.dart';
import 'package:movie_app/movies/presentation/manager/top_rating/top_rating_bloc.dart';
import 'package:movie_app/movies/presentation/manager/top_rating/top_rating_state.dart';
import 'package:movie_app/movies/presentation/screen/movie_detail_screen.dart';
import 'package:shimmer/shimmer.dart';

class TopRatingComponent extends StatelessWidget {
  const TopRatingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TopRatingBloc, TopRatingState>(
      listener: (context, state) {
     
      },
      builder: (context, state) {
        if (state is TopratingFailure) {
          return Text(
            state.errorMessage,
            style: const TextStyle(fontSize: 40, color: Colors.white),
          );
        }
        if (state is TopratingSuccess) {
          return FadeIn(
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              height: 170.0,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: state.movie.length,
                itemBuilder: (context, index) {
                  final movie = state.movie[index];
                  return Container(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailScreen(id: movie.id),));
                      },
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),
                        child: CachedNetworkImage(
                          width: 120.0,
                          fit: BoxFit.cover,
                          imageUrl: ApiConstant.imageUrl(movie.backdropPath),
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[850]!,
                            highlightColor: Colors.grey[800]!,
                            child: Container(
                              height: 170.0,
                              width: 120.0,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }
        return const SizedBox(
          height: 170,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
