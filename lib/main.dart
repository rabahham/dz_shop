import 'package:bloc/bloc.dart';
import 'package:dz_shop/screens/products/afich_products.dart';
import 'bessiness-logic/layout_cuibit/layout_cuibit.dart';
import 'shered/components/constants.dart';
import 'package:flutter/material.dart';

import 'layout/shop_layout/shop_layout.dart';
import 'screens/login/shop_login_screen.dart';
import 'screens/on_bording/on_bording.dart';
import 'shered/bloc_observer.dart';
import 'shered/network/local/chach_hlepr.dart';
import 'shered/network/remote/dio_helper.dart';
import 'shered/styles/themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();

  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  // RCacheHelper.removeData(key: 'token');
  bool onBoarding;

  onBoarding = CacheHelper.getData(key: 'onBoarding');
  if (CacheHelper.getData(key: 'token') != null) {
    token = CacheHelper.getData(key: 'token');
  }
  //onBoarding = false;

  Widget widget;

  if (onBoarding == true) {
    if (token != null && token != "hi") {
      widget = ShopLayout();
    } else {
      widget = ShopLoginScreen();
    }
  } else {
    widget = OnBordingScreen();
  }
  print(token);
  runApp(MyApp(
    // onBoarding: onBoarding,
    staretWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget staretWidget;
  // final bool onBoarding;
  const MyApp({
    Key? key,
    required this.staretWidget,
    // required this.onBoarding,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => LayoutShopCuibit()
            ..getHomeData()
            ..getCategoriesData()
            ..GetFavoritData()
            ..GetUserData(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightThem,
        darkTheme: darkThem,
        themeMode: ThemeMode.light,
        title: 'DzShop',
        home: staretWidget,
        //  home: OnBordingScreen(),d
        //  home: afichProduct(),
      ),
    );
  }
}
