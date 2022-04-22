import 'package:dz_shop/screens/login/shop_login_screen.dart';
import 'package:dz_shop/shered/components/components.dart';
import 'package:dz_shop/shered/network/local/chach_hlepr.dart';
import 'package:flutter/material.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShopDz'),
      ),
      body: Center(
        child: IconButton(
          icon: Icon(
            Icons.dangerous,
            size: 50,
          ),
          onPressed: () {
            CacheHelper.removeData(key: 'token').then((value) {
              if (value) {
                navigatToRomplace(context, ShopLoginScreen());
              }
            });
          },
          color: Colors.red,
        ),
      ),
    );
  }
}
