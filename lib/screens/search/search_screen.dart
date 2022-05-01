import '../../bessiness-logic/searsh-cuibit/searsh_cuibit.dart';
import '../../bessiness-logic/searsh-cuibit/searsh_state.dart';
import '../../models/shopappmodels/searsh_model%20copy.dart';
import '../../shered/components/components.dart';
import '../../shered/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../favorites/favorit_screen.dart';

class searchScreen extends StatelessWidget {
  const searchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var searshController = TextEditingController();
    return BlocProvider(
      create: (context) => SearshCuibit(),
      child: BlocConsumer<SearshCuibit, SearshState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    textdField(
                      controller: searshController,
                      hintText: 'Searsh',
                      prefixIconicon: Icon(Icons.search),
                      onSubmit: (String text) {
                        SearshCuibit.get(context).searsh(text: text);
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    if (state is SearshLoadingState) LinearProgressIndicator(),
                    SizedBox(
                      height: 10.0,
                    ),
                    if (state is SearshSuccessState)
                      Expanded(
                        child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) => buildLisetProdect(
                                SearshCuibit.get(context)
                                    .searchmodelProdect!
                                    .data!
                                    .data![index],
                                context,
                                isOledPrice: false),
                            separatorBuilder: (context, index) => Divider(
                                  color: Colors.grey,
                                  height: 1.0,
                                ),
                            itemCount: SearshCuibit.get(context)
                                .searchmodelProdect!
                                .data!
                                .data!
                                .length),
                      )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
