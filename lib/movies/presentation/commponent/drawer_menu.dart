import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/core/cubit/local_cubit.dart';
import 'package:movie_app/core/utils/cache_helber.dart';
import 'package:movie_app/movies/presentation/commponent/custom_row.dart';

import '../../../core/theme/enum_theme.dart';
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
            ),
           
          ],
        ),
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
               CacheHelber.saveData(key: "theme", value: true);
              LocalCubit.get(context).changeTheme(ThemeState.dark,);
             
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
               CacheHelber.saveData(key: "theme", value: false);
              LocalCubit.get(context).changeTheme(ThemeState.light,);
            }),
      ],
      blurBackgroundColor: Colors.blueGrey[900],
      menuOffset: 20,
      openWithTap: true,
      duration: const Duration(milliseconds: 200),
      animateMenuItems: true,
      onPressed: () {},
      child:
           const CustomRow(title: "theme", icon: FontAwesomeIcons.moon));
}
