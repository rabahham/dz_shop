// singout

import 'package:dz_shop/screens/login/shop_login_screen.dart';
import 'package:dz_shop/shered/components/components.dart';
import 'package:dz_shop/shered/network/local/chach_hlepr.dart';
import 'package:flutter/cupertino.dart';

void sigOut(context) {
  CacheHelper.removeData(key: 'token').then((value) {
    if (value) {
      navigatToRomplace(context, ShopLoginScreen());
    }
  });
}

// for look all print
void printFllTextss(String text) {
  final pattern = RegExp('.{1.800');
  pattern.allMatches(text).forEach((element) => element.group(0));
}

String token = '';
