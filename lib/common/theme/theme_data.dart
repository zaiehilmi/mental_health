import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final Color primaryColor = Color(0xFFFE8235);

final ThemeData temaAplikasi = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
  scaffoldBackgroundColor: Color(0xFFFFFFFF),

  appBarTheme: AppBarTheme(backgroundColor: Color(0xFFFFFFFF), toolbarHeight: 97),
  dividerColor: Color(0xffD9D8D8),
  textTheme: GoogleFonts.epilogueTextTheme().apply(
    bodyColor: Color(0xFF371B34),
    displayColor: Color(0xFF371B34),
  ),
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
      textStyle: GoogleFonts.epilogue(fontWeight: FontWeight.bold, color: Colors.white),
      elevation: 0,
    ),
  ),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      padding: EdgeInsets.zero,
      minimumSize: Size.zero,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
  ),

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: primaryColor,
    foregroundColor: Colors.white,
    shape: CircleBorder(),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey[200],
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue, width: 2)),
  ),
);
