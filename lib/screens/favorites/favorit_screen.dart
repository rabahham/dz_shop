import '../../bessiness-logic/layout_cuibit/layout_cuibit.dart';
import '../../bessiness-logic/layout_cuibit/layout_state.dart';
import '../../models/shopappmodels/favorites_model.dart';
import '../../shered/components/components.dart';
import '../../shered/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class favoritScreen extends StatelessWidget {
  const favoritScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutShopCuibit, LayoutShopState>(
        listener: (context, state) {
      // TODO: implement listener
    }, builder: (context, state) {
      return state is! LayoutShopLoadingGetFavoritesDataState
          ? ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildLisetProdect(
                  LayoutShopCuibit.get(context)
                      .getFavoritsData!
                      .data!
                      .data![index]
                      .product!,
                  context),
              separatorBuilder: (context, index) => Divider(
                    color: Colors.grey,
                    height: 1.0,
                  ),
              itemCount: LayoutShopCuibit.get(context)
                  .getFavoritsData!
                  .data!
                  .data!
                  .length)
          : Center(
              child: CircularProgressIndicator(),
            );
    });
  }
}
