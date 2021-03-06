import 'package:carousel_slider/carousel_slider.dart';
import 'package:dz_shop/screens/products/afich_products.dart';
import 'package:dz_shop/shered/components/components.dart';
import '../../bessiness-logic/layout_cuibit/layout_cuibit.dart';
import '../../bessiness-logic/layout_cuibit/layout_state.dart';
import '../../models/shopappmodels/categories_model.dart';
import '../../models/shopappmodels/homr_model_auto.dart';
import '../../shered/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var modelsHome = LayoutShopCuibit.get(context).homeModelAuto;
    var modelsCetegories = LayoutShopCuibit.get(context).categoriesModel;
    return BlocConsumer<LayoutShopCuibit, LayoutShopState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return modelsCetegories != null && modelsHome != null
            ? homeProuductsBuilder(modelsHome, modelsCetegories, context)
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  Widget homeProuductsBuilder(
          HomeModelAuto model, CategoriesModel categories, context) =>
      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: model.data!.banners!
                  .map((e) => Image(
                        image: NetworkImage('${e.image}'),
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ))
                  .toList(),
              options: CarouselOptions(
                height: 250.0,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(seconds: 1),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
                viewportFraction: 1.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Categories',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 100.0,
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          buildCategoryItem(categories.data!.data![index]),
                      separatorBuilder: (context, index) => SizedBox(
                        width: 10.0,
                      ),
                      itemCount: categories.data!.data!.length,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'New Products',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              color: Colors.grey[300],
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                childAspectRatio: 1 / 1.55,
                children: List.generate(
                    model.data!.products!.length,
                    (index) => buildGridProduct(
                        model.data!.products![index], context)),
              ),
            )
          ],
        ),
      );

  Widget buildCategoryItem(DataModel model) => Container(
        width: 100.0,
        height: 100.0,
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image(
              image: NetworkImage('${model.image}'),
              height: 100.0,
              width: 100.0,
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.all(5),
              width: double.infinity,
              color: Colors.black.withOpacity(.7),
              child: Text(
                '${model.name}',
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildGridProduct(Products model, context) => InkWell(
        onTap: () {
          navigatTo(
              context,
              afichProduct(
                model: model,
              ));
        },
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: NetworkImage(model.image!),
                    width: double.infinity,
                    // fit: BoxFit.cover,
                    height: 200,
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
                padding: const EdgeInsets.all(10.0),
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
                    Row(
                      children: [
                        Text(
                          '${model.price!.round()}', // .round() convert to int

                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color:
                                  defaultColor), // height in oreder to approximate the writing
                        ),
                        SizedBox(
                          width: 5,
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
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
