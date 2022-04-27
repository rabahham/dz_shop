import 'package:dz_shop/bessiness-logic/layout_cuibit/layout_cuibit.dart';
import 'package:dz_shop/bessiness-logic/layout_cuibit/layout_state.dart';
import 'package:dz_shop/models/shopappmodels/favorites_model.dart';
import 'package:dz_shop/shered/styles/colors.dart';
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
              itemBuilder: (context, index) => buildFavoriteItems(
                  LayoutShopCuibit.get(context)
                      .getFavoritsData!
                      .data!
                      .data![index],
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

  Widget buildFavoriteItems(DataProdect model, context) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 120.0,
          // color: Colors.white,
          child: Row(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: NetworkImage(model.product!.image!),
                    fit: BoxFit.cover,
                    height: 120.0,
                  ),
                  if (model.product!.discount != null)
                    Container(
                      color: Colors.red,
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(
                        'DISCOUNT',
                        style: TextStyle(fontSize: 10.0, color: Colors.white),
                      ),
                    ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${model.product!.name!}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 14.0,
                          // height: 1.3,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          // '${model.price!.round()}', // .round() convert to int
                          '${model.product!.price!.round()} DA',
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color:
                                  defaultColor), // height in oreder to approximate the writing
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        if (model.product!.oldPrice! != null)
                          Text(
                            // .round() convert to int
                            '${model.product!.oldPrice!.round()} DA',
                            style: TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                decoration: TextDecoration
                                    .lineThrough), // height in oreder to approximate the writing
                          ),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            LayoutShopCuibit.get(context)
                                .changeFavorites(model.product!.id!);
                            print('chagale');
                          },
                          icon: LayoutShopCuibit.get(context)
                                  .favorites[model.product!.id]!
                              ? Icon(
                                  Icons.favorite_sharp,
                                  color: Colors.red,
                                )
                              : Icon(Icons.favorite_border),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
