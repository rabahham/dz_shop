import '../../models/shopappmodels/shop_model.dart';

abstract class ShopLginState {}

class ShopLoginInitialState extends ShopLginState {}

class ShopLoginLoadingState extends ShopLginState {}

class ShopLoginSuccessState extends ShopLginState {
  ShopLoginModel loginModel;
  ShopLoginSuccessState({
    required this.loginModel,
  });
}

class ShopLoginErrorState extends ShopLginState {
  String? error;
  ShopLoginErrorState({
    this.error,
  });
}

class ShopLoginPasswordVisibleState extends ShopLginState {}
