import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/movies/presentation/commponent/drawer.dart';

class SplachCommponent extends StatefulWidget {
  const SplachCommponent({super.key});

  @override
  State<SplachCommponent> createState() => _SplachCommponentState();
}

class _SplachCommponentState extends State<SplachCommponent> {
  @override
  void initState() {
   
    super.initState();
    Future.delayed(const Duration(seconds: 5),navigator);
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Lottie.asset("assets/animations/splach.json")],
      ),
    );
  }

  void navigator() {
    
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const DrawerView();
    },));
  }
}
