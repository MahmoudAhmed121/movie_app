
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/movies/presentation/commponent/gener_list_view_component.dart';
import 'package:movie_app/movies/presentation/commponent/now_playing_component.dart';
import 'package:movie_app/movies/presentation/commponent/discover_component.dart';
import 'package:movie_app/movies/presentation/commponent/top_rateing_component.dart';



class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        key: const Key('movieScrollView'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              const NowPlayingComponent(),
              IconButton(
                  onPressed: () {
                    ZoomDrawer.of(context)!.toggle();
                  },
                  icon: const Icon(
                    Icons.menu,
                    size: 30,
                  ))
            ]),
            const SizedBox(
              height: 30,
            ),
            const CustomGenersListView(),
            Container(
              margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Discover",
                    style: GoogleFonts.poppins(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.15,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child:   const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                           "see more",
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16.0,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const DiscoverComponent(),
            Container(
              margin: const EdgeInsets.fromLTRB(
                16.0,
                24.0,
                16.0,
                8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Rated",
                    style: GoogleFonts.poppins(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.15,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      /// TODO : NAVIGATION TO Top Rated Movies Screen
                    },
                    child:  const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "see more",
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16.0,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const TopRatingComponent(),
            const SizedBox(height: 25.0),
          ],
        ),
      ),
    );
  }
}




