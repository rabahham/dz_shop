import 'package:dz_shop/screens/on_bording/on_bording.dart';
import 'package:dz_shop/shered/styles/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightThem,
      darkTheme: darkThem,
      themeMode: ThemeMode.light,
      title: 'DzShop',
      home: OnBordingScreen(),
    );
  }
}
