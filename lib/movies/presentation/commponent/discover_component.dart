import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/shimmer/container_shimmer.dart';
import 'package:movie_app/core/shimmer/list_view_loading_shimmer.dart';
import 'package:movie_app/core/utils/api_constant.dart';
import 'package:movie_app/movies/presentation/manager/populer/populer_bloc.dart';
import 'package:movie_app/movies/presentation/manager/populer/populer_state.dart';
import 'package:movie_app/movies/presentation/screen/movie_detail_screen.dart';

class DiscoverComponent extends StatelessWidget {
  const DiscoverComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PopularBloc, PopulerState>(
      listener: (context, state) {
         if (state is PopulerSuccess) {
          print("3 ${state.errorMessage}");

          if (state.errorMessage != "") {
            ScaffoldMessenger.of(context).showSnackBar(
               SnackBar(
                backgroundColor: const Color.fromARGB(255, 124, 116, 116),
                content: Text(
               state.errorMessage,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            );
          }
        }
    
      },
      builder: (context, state) {
        if (state is PopulerFailure) {
          return Text(
            state.errMessages,
            style: const TextStyle(fontSize: 40, color: Colors.white),
          );
        }
        if (state is PopulerSuccess) {
          return FadeIn(
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              height: 200.0,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: state.movie.length,
                itemBuilder: (context, index) {
                  final movie = state.movie[index];
                  return Column(
                    children: [
                      Container(
                        height: 170,
                        padding: const EdgeInsets.only(right: 8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MovieDetailScreen(id: movie.id),
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8.0)),
                            child: CachedNetworkImage(
                              width: 120.0,
                              fit: BoxFit.cover,
                              imageUrl:
                                  ApiConstant.imageUrl(movie.backdropPath),
                              placeholder: (context, url) =>
                                  const ContainerShimmer(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 120,
                        child: Text(
                          textAlign: TextAlign.center,
                          state.movie[index].title,
                          style: const TextStyle(
                              fontSize: 16, overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        }
        return const ListViewLoadingShimmer();
      },
    );
  }
}
