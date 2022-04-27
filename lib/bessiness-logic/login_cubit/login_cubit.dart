import 'package:bloc/bloc.dart';
import 'package:dz_shop/bessiness-logic/login_cubit/login-state.dart';
import 'package:dz_shop/models/shopappmodels/shop_model.dart';
import 'package:dz_shop/shered/components/constants.dart';
import 'package:dz_shop/shered/network/end_points.dart';
import 'package:dz_shop/shered/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLoginCubit extends Cubit<ShopLginState> {
  ShopLoginCubit() : super(ShopLoginInitialState());
  static ShopLoginCubit get(context) => BlocProvider.of(context);

  // object ShopLoginModel
  late ShopLoginModel loginModel;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(ShopLoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      // ignore: avoid_print
      print(value!.data.toString());
      loginModel = ShopLoginModel.fromJson(value.data);
      token = loginModel.data!.token!;

      // print(loginModel.status);
      // print(loginModel.data?.token);
      emit(ShopLoginSuccessState(loginModel: loginModel));
    }).catchError((error) {
      print(error.toString());
      emit(ShopLoginErrorState(error: error.toString()));
    });
  }

  // passwordVisible
  var passwordVisible = true;

  void passWordVisible() {
    passwordVisible = !passwordVisible;
    emit(ShopLoginPasswordVisibleState());
  }
}
