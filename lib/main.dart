import 'package:bloc/bloc.dart';
import 'package:dz_shop/screens/login/shop_login_screen.dart';
import 'package:flutter/material.dart';

import 'package:dz_shop/screens/on_bording/on_bording.dart';
import 'package:dz_shop/shered/bloc_observer.dart';
import 'package:dz_shop/shered/network/local/chach_hlepr.dart';
import 'package:dz_shop/shered/network/remote/dio_helper.dart';
import 'package:dz_shop/shered/styles/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();

  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();

  bool onBoarding = CacheHelper.getData(key: 'onBoarding');
  print('rani f main');
  print(onBoarding);
  runApp(MyApp(
    onBoarding: onBoarding,
  ));
}

class MyApp extends StatelessWidget {
  final bool onBoarding;
  const MyApp({
    Key? key,
    required this.onBoarding,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightThem,
      darkTheme: darkThem,
      themeMode: ThemeMode.light,
      title: 'DzShop',
      home: onBoarding ? ShopLoginScreen() : OnBordingScreen(),
    );
  }
}
