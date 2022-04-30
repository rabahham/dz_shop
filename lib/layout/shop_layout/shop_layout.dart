import 'package:dz_shop/bessiness-logic/layout_cuibit/layout_cuibit.dart';
import 'package:dz_shop/bessiness-logic/layout_cuibit/layout_state.dart';
import 'package:dz_shop/screens/login/shop_login_screen.dart';
import 'package:dz_shop/screens/search/search_screen.dart';
import 'package:dz_shop/shered/components/components.dart';
import 'package:dz_shop/shered/network/local/chach_hlepr.dart';
import 'package:dz_shop/shered/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutShopCuibit, LayoutShopState>(
        builder: (context, state) {
          var cuibt = LayoutShopCuibit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('ShopDz'),
              actions: [
                IconButton(
                    onPressed: () {
                      navigatTo(context, searchScreen());
                    },
                    icon: Icon(Icons.search))
              ],
            ),
            body: cuibt.bottomScreens[cuibt.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                cuibt.changeBottom(index);
              },
              currentIndex: cuibt.currentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.apps),
                  label: 'Cateogries',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
              selectedItemColor: defaultColor,
            ),
          );
        },
        listener: (context, state) {});
  }
}
