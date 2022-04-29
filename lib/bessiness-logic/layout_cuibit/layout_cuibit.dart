// import 'dart:html';

import 'dart:io';
import 'dart:async';

import 'package:dz_shop/bessiness-logic/layout_cuibit/layout_state.dart';
import 'package:dz_shop/models/shopappmodels/categories_model.dart';
import 'package:dz_shop/models/shopappmodels/change_favorites_model.dart';
import 'package:dz_shop/models/shopappmodels/favorites_model.dart';
import 'package:dz_shop/models/shopappmodels/home_models.dart';
import 'package:dz_shop/models/shopappmodels/homr_model_auto.dart';
import 'package:dz_shop/models/shopappmodels/shop_model.dart';
import 'package:dz_shop/screens/cateogries/cateogrie_screen.dart';
import 'package:dz_shop/screens/favorites/favorit_screen.dart';
import 'package:dz_shop/screens/products/products_screen.dart';
import 'package:dz_shop/screens/search/search_screen.dart';
import 'package:dz_shop/screens/settings/settings_screen.dart';
import 'package:dz_shop/shered/network/end_points.dart';
import 'package:dz_shop/shered/network/remote/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dz_shop/shered/components/constants.dart';
import 'package:image_picker/image_picker.dart';

class LayoutShopCuibit extends Cubit<LayoutShopState> {
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

  Map<int, bool> favorites = {};

  HomeModelAuto? homeModelAuto;

  void getHomeData() {
    emit(LayoutShopLoadingHomeDataState());

    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value) {
      // print(value.data.toString());
      // print('secseeeeeeeeee');

      homeModelAuto = HomeModelAuto.fromJson(value.data);
      homeModelAuto!.data!.products!.forEach((element) {
        favorites.addAll({
          element.id!: element.inFavorites!,
        });
      });
      // print(favorites.toString());
      // print('rani f success');

      emit(LayoutShopSuccessHomeDataState());
    }).catchError((error) {
      print(error.toString());
      emit(LayoutShopErrorHomeDataState());
    });
  }

  CategoriesModel? categoriesModel;

  void getCategoriesData() {
    DioHelper.getData(
      url: GET_CATEGORIES,
    ).then((value) {
      // print(value.data.toString());
      // print('secseeeeeeeeee cetegories');

      categoriesModel = CategoriesModel.fromJson(value.data);
      // print('rani f success cetegor');

      emit(LayoutShopSuccessCategiesDataState());
    }).catchError((error) {
      print(error.toString());
      emit(LayoutShopErrorCategoriesDataState());
    });
  }

  ChangeFavoritesModel? changeFavoritesModel;

  void changeFavorites(int productId) {
    favorites[productId] = !favorites[productId]!; // for change mode favorites
    emit(LayoutShopSuccessChangeFavoritessDataState()); // for rebuiled
    DioHelper.postData(
      url: FAVORITES,
      data: {
        'product_id': productId,
      },
      token: token,
    ).then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value!.data);
      print(value.data);
      if (!changeFavoritesModel!.status!) {
        favorites[productId] =
            !favorites[productId]!; // If something goes wrong,
      } else {
        GetFavoritData();
      }

      emit(LayoutShopSuccessChangeFavoritessDataState());
    }).catchError((errror) {
      favorites[productId] = !favorites[
          productId]!; // If something goes wrong, it goes back to its origin
      emit(LayoutShopErrorChangeFavoritesDataState());
    });
  }

  GetFavoritesModel? getFavoritsData;

  void GetFavoritData() {
    emit(LayoutShopLoadingGetFavoritesDataState());
    DioHelper.getData(
      url: FAVORITES,
      token: token,
    ).then((value) {
      getFavoritsData = GetFavoritesModel.fromJson(value.data);

      print('rani f success');

      emit(LayoutShopSuccessGetFavoritesDataState());
    }).catchError((error) {
      print(error.toString());
      emit(LayoutShopErrorGetFavoriteDataState());
    });
  }

  // get data profile
  ShopLoginModel? getUserData;

  void GetUserData() {
    emit(LayoutShopLoadingGetProfileDataState());

    DioHelper.getData(
      url: GETPROFILE,
      token: token,
    ).then((value) {
      getUserData = ShopLoginModel.fromJson(value.data);

      emit(LayoutShopSuccessGetProfileDataState());
    }).catchError((error) {
      print(error.toString());
      emit(LayoutShopErrorGetProfileDataState());
    });
  }

  File? file; // for photo de profile

  // function get camera photo profile

  // Future pickercameraprofile(ImageSource source) async {
  //   try {
  //     final mygfile = await ImagePicker().pickImage(source: source);
  //     if (mygfile == null) {
  //       return;
  //     }

  //     //final imageTemp = File(mygfile.path);
  //     file = File(mygfile.path);

  //     // ignore:
  //     // nullable_type_in_catch_clause;

  //     emit(LayoutShopSuccessPickPhotoState());
  //   } on PlatformException catch (e) {
  //     print('Failed to pick image: $e');
  //     // emit(LayoutShopErrorPickPhotoPState());
  //   }
  // }

  void apickercameraprofile(ImageSource s) {
    ImagePicker().pickImage(source: s).then((value) {
      if (value == null) {
        return;
      }
      file = File(value.path);
      print(value.name.toString());

      emit(LayoutShopSuccessPickPhotoState());
    }).catchError((e) {
      print('Failed to pick image: $e');
      emit(LayoutShopErrorPickPhotoPState());
    });
  }
}
