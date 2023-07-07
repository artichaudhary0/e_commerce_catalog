import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Colors.white,
    canvasColor: creamColor,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
      titleTextStyle: TextStyle(color: Colors.black),
    ), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple).copyWith(secondary: darkBluishColor),
  );
  static ThemeData darkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Colors.black,
    canvasColor: MyTheme.darkCreamColor,
    appBarTheme: AppBarTheme(
      color: Colors.black,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white),
    ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
  );

  static ThemeData girlishPink(BuildContext context) => ThemeData(
    brightness: Brightness.light,
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: MyTheme.pinkColor,
    canvasColor: MyTheme.darkpinkColor,
    appBarTheme: AppBarTheme(
      color: Colors.black,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
    ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
  );

  static Color creamColor = Color(0xfff1eded);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Colors.indigo.shade600;
  static Color captionStyle = Colors.blueGrey.shade800;
  static Color pinkColor = Color(0xffec407a);
  static Color darkpinkColor = Color(0xff880e4f);
  static Color lightpinkColor = Color(0xfff48fb1);
  static Color buttonColor= Colors.green;
}
