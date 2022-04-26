import 'package:dz_shop/bessiness-logic/layout_cuibit/layout_cuibit.dart';
import 'package:dz_shop/bessiness-logic/layout_cuibit/layout_state.dart';
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
      return ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildFavoriteItems(),
          separatorBuilder: (context, index) => Divider(
                color: Colors.grey,
                height: 1.0,
              ),
          itemCount: 10);
    });
  }

  Widget buildFavoriteItems() => Padding(
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
                    image: NetworkImage(
                        'https://student.valuxapps.com/storage/uploads/categories/16445270619najK.6242655.jpg'),
                    fit: BoxFit.cover,
                    height: 120.0,
                  ),
                  if (1 != 0)
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Phone 5',
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
                          '2000 ',
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color:
                                  defaultColor), // height in oreder to approximate the writing
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        if (1 != 0)
                          Text(
                            // '${model.oldPrice!.round()}', // .round() convert to int
                            '55000 da',
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
                            // LayoutShopCuibit.get(context)
                            //     .changeFavorites(model.id!);
                            // print('chagale');
                          },
                          icon: true
                              // LayoutShopCuibit.get(context).favorites[model.id]!
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
