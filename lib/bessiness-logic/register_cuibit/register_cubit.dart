import 'package:bloc/bloc.dart';
import 'package:dz_shop/bessiness-logic/login_cubit/login-state.dart';
import 'package:dz_shop/bessiness-logic/register_cuibit/register-state.dart';
import 'package:dz_shop/models/shopappmodels/shop_model.dart';
import 'package:dz_shop/shered/components/constants.dart';
import 'package:dz_shop/shered/network/end_points.dart';
import 'package:dz_shop/shered/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterState> {
  ShopRegisterCubit() : super(ShopregisterInitialState());
  static ShopRegisterCubit get(context) => BlocProvider.of(context);

  // object ShopLoginModel
  late ShopLoginModel regisetrModel;

  void userRegister({
    required String email,
    required String phone,
    required String password,
    required String name,
  }) {
    emit(ShopRegisterLoadingState());
    DioHelper.postData(
      url: REGISTER,
      data: {
        'email': email,
        'password': password,
        'name': name,
        'phone': phone,
      },
    ).then((value) {
      // ignore: avoid_print
      print(value!.data.toString());
      regisetrModel = ShopLoginModel.fromJson(value.data);
      token = regisetrModel.data!.token!;

      // print(loginModel.status);
      // print(loginModel.data?.token);
      emit(ShopRegisterSuccessState(regisetrModel: regisetrModel));
    }).catchError((error) {
      print(error.toString());
      emit(ShopregisterErrorState(error: error.toString()));
    });
  }

  // passwordVisible
  var passwordVisible = true;

  void passWordVisible() {
    passwordVisible = !passwordVisible;
    emit(ShopRegistersPasswordVisibleState());
  }
}
