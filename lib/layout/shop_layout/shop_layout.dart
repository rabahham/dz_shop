import '../../bessiness-logic/layout_cuibit/layout_cuibit.dart';
import '../../bessiness-logic/layout_cuibit/layout_state.dart';
import '../../screens/login/shop_login_screen.dart';
import '../../screens/search/search_screen.dart';
import '../../shered/components/components.dart';
import '../../shered/network/local/chach_hlepr.dart';
import '../../shered/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

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
            body: OfflineBuilder(
              connectivityBuilder: (
                BuildContext context,
                ConnectivityResult connectivity,
                Widget child,
              ) {
                final bool connected = connectivity != ConnectivityResult.none;
                if (connected) {
                  return cuibt.bottomScreens[cuibt.currentIndex];
                } else {
                  return Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Image.asset('assets/images/ofline.png'),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Can\'t connect ..  check internet!!!!',
                          style: TextStyle(fontSize: 22, color: defaultColor),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Center(
                child: CircularProgressIndicator(
                  color: defaultColor,
                ),
              ),
            ),
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
