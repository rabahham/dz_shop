import 'colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightThem = ThemeData(
  //   floatingActionButtonTheme:
  //      FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
  fontFamily: 'Rubik',
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    titleSpacing: 20.0,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    titleTextStyle: TextStyle(
        color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
    // backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    elevation: 20.0,
    backgroundColor: Colors.white,
    unselectedItemColor: Colors.grey,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),
);

// dark Theme
ThemeData darkThem = ThemeData(
  fontFamily: 'Rubik',
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
  scaffoldBackgroundColor: HexColor('333739'),
  primarySwatch: defaultColor,
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    titleTextStyle: TextStyle(
        color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
    // backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('333739'),
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: HexColor('333739'),
    elevation: 0.0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: HexColor('333739'),
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: defaultColor,
      elevation: 20.0),
);
