import 'package:bloc/bloc.dart';
import '../login_cubit/login-state.dart';
import 'register-state.dart';
import '../../models/shopappmodels/shop_model.dart';
import '../../shered/components/constants.dart';
import '../../shered/network/end_points.dart';
import '../../shered/network/remote/dio_helper.dart';
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

      regisetrModel = ShopLoginModel.fromJson(value!.data);
      token = regisetrModel.data!.token!;
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
