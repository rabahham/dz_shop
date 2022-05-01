import 'package:bloc/bloc.dart';
import 'login-state.dart';
import '../../models/shopappmodels/shop_model.dart';
import '../../shered/components/constants.dart';
import '../../shered/network/end_points.dart';
import '../../shered/network/remote/dio_helper.dart';
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

      loginModel = ShopLoginModel.fromJson(value!.data);
      if (loginModel.data != null) {
        token = loginModel.data!.token!;
      }

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
