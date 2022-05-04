import 'package:dz_shop/bessiness-logic/layout_cuibit/layout_cuibit.dart';
import 'package:dz_shop/bessiness-logic/layout_cuibit/layout_state.dart';
import 'package:flutter/material.dart';

import 'package:dz_shop/layout/shop_layout/shop_layout.dart';
import 'package:dz_shop/screens/products/products_screen.dart';
import 'package:dz_shop/shered/components/components.dart';
import 'package:dz_shop/shered/styles/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class afichProduct extends StatelessWidget {
  var model;
  afichProduct({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutShopCuibit, LayoutShopState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          // appBar: AppBar(),
          body: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: NetworkImage(model.image!),
                    width: double.infinity,
                    // fit: BoxFit.cover,
                    height: 450,
                  ),
                  if (model.discount != 0)
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 260,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                model.name!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    // height: 1.3,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${model.price!.round()} ',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                        color: defaultColor),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  if (model.discount != 0)
                                    Text(
                                      '${model.oldPrice!.round()}', // .round() convert to int

                                      style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                          decoration: TextDecoration
                                              .lineThrough), // height in oreder to approximate the writing
                                    ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            LayoutShopCuibit.get(context)
                                .changeFavorites(model.id!);
                            // print('chagale');
                          },
                          icon:
                              LayoutShopCuibit.get(context).favorites[model.id]!
                                  ? Icon(
                                      Icons.favorite_sharp,
                                      color: Colors.red,
                                    )
                                  : Icon(Icons.favorite_border),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      height: 200.0,
                      child: SingleChildScrollView(
                        child: Text(model.description),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        defultButtonIcon(
                          colorText: Colors.redAccent,
                          icon: Icon(
                            Icons.arrow_forward,
                            color: Colors.redAccent,
                          ),
                          text: 'Cancel',
                          function: () {
                            navigatTo(context, ShopLayout());
                          },
                          background: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        defultButtonIcon(
                          opositeIcon: false,
                          icon: Icon(
                            Icons.add_shopping_cart,
                            color: Colors.white,
                          ),
                          text: 'Buy Now',
                          function: () {
                            //  navigatTo(context, ProductsScreen());
                          },
                          background: defaultColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
