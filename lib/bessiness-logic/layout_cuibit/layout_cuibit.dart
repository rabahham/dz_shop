// import 'dart:html';

import 'package:dz_shop/bessiness-logic/layout_cuibit/layout_state.dart';
import 'package:dz_shop/models/shopappmodels/home_models.dart';
import 'package:dz_shop/models/shopappmodels/homr_model_auto.dart';
import 'package:dz_shop/screens/cateogries/cateogrie_screen.dart';
import 'package:dz_shop/screens/favorites/favorit_screen.dart';
import 'package:dz_shop/screens/products/products_screen.dart';
import 'package:dz_shop/screens/search/search_screen.dart';
import 'package:dz_shop/screens/settings/settings_screen.dart';
import 'package:dz_shop/shered/network/end_points.dart';
import 'package:dz_shop/shered/network/remote/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dz_shop/shered/components/constants.dart';

class LayoutShopCuibit extends Cubit<LayoutShopState> {
  LayoutShopCuibit() : super(LayoutShopInitailState());
  static LayoutShopCuibit get(context) => BlocProvider.of(context);

  late HomeModelAuto homeModelAuto;

  int currentIndex = 0;

  List<Widget> bottomScreens = [
    ProductsScreen(),
    cateogrieScreen(),
    favoritScreen(),
    settingsScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(LayoutShopChangeBottmNavState());
  }

  void getHomeData() {
    emit(LayoutShopLoadingHomeDataState());

    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value) {
      print(value.data.toString());
      print('secseeeeeeeeee');

      homeModelAuto = HomeModelAuto.fromJson(value.data);
      print('rani f success');
      // print(homeModel!.data!.banners![0].image);
      print(homeModelAuto.status);
      print(homeModelAuto.data!.banners![0].image);

      // print(homeModel.toString());
      // print('hhhhhhhhhhhhhhhhhhhhhhhh');
      // printFllTextss(homeModel.toString());
      emit(LayoutShopSuccessHomeDataState());
    }).catchError((error) {
      print(error.toString());
      emit(LayoutShopErrorHomeDataState());
    });
  }
}
