abstract class ShopLginState {}

class ShopLoginInitialState extends ShopLginState {}

class ShopLoginLoadingState extends ShopLginState {}

class ShopLoginSuccessState extends ShopLginState {}

class ShopLoginErrorState extends ShopLginState {
  String? error;
  ShopLoginErrorState({
    this.error,
  });
}

class ShopLoginPasswordVisibleState extends ShopLginState {}
