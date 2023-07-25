
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movies/presentation/commponent/outline_buttom.dart';
import 'package:movie_app/movies/presentation/manager/genres_home_page/genres_bloc.dart';
import 'package:movie_app/movies/presentation/manager/populer/populer_bloc.dart';
import 'package:movie_app/movies/presentation/manager/populer/populer_event.dart';

import '../manager/genres_home_page/genres_state.dart';

class CustomGenersListView extends StatefulWidget {
  const CustomGenersListView({super.key});

  @override
  State<CustomGenersListView> createState() => _CustomGenersListViewState();
}

class _CustomGenersListViewState extends State<CustomGenersListView> {
  int selectGeners = 28;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenresBloc, GenresState>(builder: (context, state) {
      if (state is GenresSuccess) {
        return SizedBox(
          height: 45,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: state.generHomePage.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  FieldOutlineButton(
                    selectGeners: selectGeners,
                    generes: state.generHomePage[index].id,
                    press: () {
                      setState(() {
                        selectGeners = state.generHomePage[index].id;
                        context.read<PopularBloc>().add(
                            GetPopulerEvent(id: state.generHomePage[index].id, ));
                      });
                    },
                    text: state.generHomePage[index].name,
                  )
                ],
              );
            },
            separatorBuilder: (context, index) {
              return const VerticalDivider(
                color: Colors.transparent,
                width: 5,
              );
            },
          ),
        );
      }
      return const SizedBox();
    });
  }
}