import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kostanku/modules/splashscreen/splashscreen_view.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: SplashScreen(),
    ),
  );
}
