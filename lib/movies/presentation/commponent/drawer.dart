import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/movies/presentation/commponent/drawer_menu.dart';
import 'package:movie_app/movies/presentation/screen/movies_screen.dart';
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
