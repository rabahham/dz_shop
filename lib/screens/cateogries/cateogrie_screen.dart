import 'package:dz_shop/bessiness-logic/layout_cuibit/layout_cuibit.dart';
import 'package:dz_shop/bessiness-logic/layout_cuibit/layout_state.dart';
import 'package:dz_shop/models/shopappmodels/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class cateogrieScreen extends StatelessWidget {
  const cateogrieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var modelsCetegories = LayoutShopCuibit.get(context).categoriesModel;
    return BlocConsumer<LayoutShopCuibit, LayoutShopState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                buildCatigoriesItems(modelsCetegories!.data!.data![index]),
            separatorBuilder: (context, index) => Divider(
                  color: Colors.grey,
                  height: 1,
                ),
            itemCount: modelsCetegories!.data!.data!.length);
      },
    );
  }

  Widget buildCatigoriesItems(DataModel model) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Image(
              image: NetworkImage(
                model.image!,
              ),
              width: 120,
              height: 120,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              model.name!,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Icon(
              Icons.arrow_right,
              size: 40,
            ),
          ],
        ),
      );
}
