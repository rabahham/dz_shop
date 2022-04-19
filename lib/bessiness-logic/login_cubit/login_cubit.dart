import 'package:bloc/bloc.dart';
import 'package:dz_shop/bessiness-logic/login_cubit/login-state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLoginCubit extends Cubit<ShopLginState> {
  ShopLoginCubit() : super(ShopLoginInitialState());
  static ShopLoginCubit get(context) => BlocProvider.of(context);

  void userLogin() {}
}
