import 'package:flutter/material.dart';
import 'package:movie_app/core/shimmer/container_shimmer.dart';

class ListViewLoadingShimmer extends StatelessWidget {
  const ListViewLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          height: 200.0,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 7.0,
                ),
                child: ContainerShimmer(),
              );
            },
          ),
        );
  }
}