import 'package:dz_shop/bessiness-logic/layout_cuibit/layout_cuibit.dart';
import 'package:dz_shop/bessiness-logic/layout_cuibit/layout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutShopCuibit, LayoutShopState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return LayoutShopCuibit.get(context).homeModelAuto != null
            ? homeProuductsBuilder()
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  Widget homeProuductsBuilder() => Column();
}
