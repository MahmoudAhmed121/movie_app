import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/constant.dart';
import 'package:movie_app/movies/presentation/manager/cast/cast_bloc.dart';
import 'package:movie_app/movies/presentation/manager/cast/cast_state.dart';
import 'package:shimmer/shimmer.dart';

class CustomCastView extends StatelessWidget {
  const CustomCastView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastBloc, CastState>(
      builder: (context, state) {
        if (state is CastSuccess) {
          return SliverToBoxAdapter(
            child: FadeInUp(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.cast.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: SizedBox(
                        width: 100,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 97,
                              height: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: CachedNetworkImage(
                                  imageUrl: ApiConstant.imageUrl(
                                      state.cast[index].photo),
                                  placeholder: (context, url) =>
                                      Shimmer.fromColors(
                                    baseColor: Colors.grey[850]!,
                                    highlightColor: Colors.grey[800]!,
                                    child: Container(
                                      width: 97,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              textAlign: TextAlign.center,
                              state.cast[index].name,
                              style: const TextStyle(fontSize: 16,
                              overflow: TextOverflow.ellipsis
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        }

        return const SliverToBoxAdapter(
          child: SizedBox(),
        );
      },
    );
  }
}
