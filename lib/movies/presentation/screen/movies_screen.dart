// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/cubit/app_theme_cubit.dart';
import 'package:movie_app/core/theme/enum_theme.dart';
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
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'See More',
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
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'See More',
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

class DrawerView extends StatefulWidget {
  const DrawerView({Key? key}) : super(key: key);

  @override
  _DrawerViewState createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  final zoomDrawerController = ZoomDrawerController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: zoomDrawerController,
      menuScreen: const MenuScreen(),
      mainScreen: const MainMoviesScreen(),
      style: DrawerStyle.defaultStyle,
      moveMenuScreen: false,
      showShadow: true,
      angle: 0,
      isRtl: false,
      drawerShadowsBackgroundColor: Colors.grey.shade300,
      menuBackgroundColor: Theme.of(context).primaryColor,
      slideWidth: 200,
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(55),
                child: Image.asset(
                  "assets/images/mahmoud.jpg",
                  width: 90,
                )),
            const SizedBox(
              height: 10,
            ),
            const Text("Mahmoud Ahmed"),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.grey,
            ),
            const CustomOptionRow(
              icon: Icons.translate_rounded,
              title: "translate",
            ),
            const SizedBox(
              height: 10,
            ),
            barMenu(context),
            const Spacer(),
            const Text(
              "Version 1.0.0",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

class CustomOptionRow extends StatelessWidget {
  const CustomOptionRow({
    super.key,
    required this.title,
    required this.icon,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.grey, size: 30),
              const SizedBox(width: 25),
              Text(
                title,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

FocusedMenuHolder barMenu(BuildContext context) {
  double widthScreen = MediaQuery.of(context).size.width;

  return FocusedMenuHolder(
      menuWidth: widthScreen * 0.3,
      blurSize: 7,
      menuItems: [
        FocusedMenuItem(
            title: const Text(
              "Dark Theme",
              style: TextStyle(color: Colors.white),
            ),
            trailingIcon: const Icon(Icons.arrow_forward_ios_rounded,
                color: Colors.white, size: 14),
            backgroundColor: const Color(0xff16122B),
            onPressed: () {
              AppThemeCubit.get(context).changeTheme(ThemeState.dark);
            }),
        FocusedMenuItem(
            title: const Text(
              "Light Theme",
              style: TextStyle(color: Color(0xff16122B)),
            ),
            trailingIcon: const Icon(Icons.arrow_forward_ios_rounded,
                color: Color(0xff16122B), size: 14),
            backgroundColor: Colors.white,
            onPressed: () {
              AppThemeCubit.get(context).changeTheme(ThemeState.light);
            }),
      ],
      blurBackgroundColor: Colors.blueGrey[900],
      menuOffset: 20,
      openWithTap: true,
      duration: const Duration(milliseconds: 200),
      animateMenuItems: true,
      onPressed: () {},
      child: const CustomOptionRow(title: "Theme", icon:  FontAwesomeIcons.moon));
}
