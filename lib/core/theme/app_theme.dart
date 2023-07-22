import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      
      scaffoldBackgroundColor: const Color.fromARGB(255, 237, 237, 237),
      textTheme: GoogleFonts.montserratTextTheme(ThemeData.light().textTheme),
      primaryColor:const Color(0xff16122B),
      iconTheme: const IconThemeData(size: 100,color: Colors.white)
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xff16122B),
      primaryColor: Colors.white,
      iconTheme: const IconThemeData(size: 100,color: Colors.white),
      textTheme: GoogleFonts.montserratTextTheme(
        ThemeData.dark().textTheme,
      ),
    );
  }
}
