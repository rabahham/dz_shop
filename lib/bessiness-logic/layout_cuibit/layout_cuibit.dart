import 'package:dz_shop/bessiness-logic/layout_cuibit/layout_state.dart';
import 'package:dz_shop/screens/cateogries/cateogrie_screen.dart';
import 'package:dz_shop/screens/favorites/favorit_screen.dart';
import 'package:dz_shop/screens/products/products_screen.dart';
import 'package:dz_shop/screens/search/search_screen.dart';
import 'package:dz_shop/screens/settings/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutShopCuibit extends Cubit<LayoutShopState> {
  // LayoutShopCuibit() : super(LayoutShopInitailState());
  // static LayoutShopCuibit get(context) => BlocProvider.of(context);

  LayoutShopCuibit() : super(LayoutShopInitailState());
  static LayoutShopCuibit get(context) => BlocProvider.of(context);

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
}
