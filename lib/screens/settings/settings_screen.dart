import 'package:dz_shop/bessiness-logic/layout_cuibit/layout_cuibit.dart';
import 'package:dz_shop/bessiness-logic/layout_cuibit/layout_state.dart';
import 'package:dz_shop/shered/components/components.dart';
import 'package:dz_shop/shered/components/constants.dart';
import 'package:dz_shop/shered/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class settingsScreen extends StatelessWidget {
  const settingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    // scafoled key for bottom sheet
    var scaffoldKey = GlobalKey<ScaffoldState>();

    // editing controller
    final TextEditingController emailController = new TextEditingController();
    final TextEditingController nameController = new TextEditingController();

    final TextEditingController phoneController = new TextEditingController();

    // string for displaying the error Message
    String? errorMessage;

    return BlocConsumer<LayoutShopCuibit, LayoutShopState>(
      builder: (context, state) {
        var cuibtLayout = LayoutShopCuibit.get(context);

        String photoDeProfile =
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiEpPw-lF6pxba72HeJW7ovks7g6k14Izj-A&usqp=CAU';

        emailController.text = cuibtLayout.getUserData!.data!.email!;
        nameController.text = cuibtLayout.getUserData!.data!.name!;
        phoneController.text = cuibtLayout.getUserData!.data!.phone!;
        photoDeProfile = cuibtLayout.getUserData!.data!.image!;

        return LayoutShopCuibit.get(context).getUserData != null
            ? Scaffold(
                key: scaffoldKey,
                body: Container(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40,
                            ),

                            Align(
                              alignment: Alignment.center,
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: defaultColor, width: 5),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(100),
                                      ),
                                    ),
                                    child: ClipOval(
                                      child: Image.network(
                                        photoDeProfile,
                                        width: 170,
                                        height: 170,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 5,
                                    child: IconButton(
                                      onPressed: () {
                                        scaffoldKey.currentState
                                            ?.showBottomSheet(
                                          (context) => Container(
                                            height: 140,
                                            //color: Colors.amber,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                ListTile(
                                                  leading: Icon(Icons.camera),
                                                  title: Text('camera'),
                                                  onTap: () {
                                                    LayoutShopCuibit.get(
                                                            context)
                                                        .apickercameraprofile(
                                                            ImageSource.camera);
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                                Divider(),
                                                ListTile(
                                                  leading:
                                                      Icon(Icons.photo_album),
                                                  title: Text('gallery'),
                                                  onTap: () {
                                                    LayoutShopCuibit.get(
                                                            context)
                                                        .apickercameraprofile(
                                                            ImageSource
                                                                .gallery);
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.add_a_photo_outlined,
                                        color: Colors.orangeAccent,
                                        size: 30,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            // Email
                            emailField(
                              controller: emailController,
                              hintText: 'Email',
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            // passwordFielde,
                            emailField(
                              controller: nameController,
                              hintText: 'Name',
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            emailField(
                              controller: phoneController,
                              hintText: 'Phone',
                            ),

                            SizedBox(
                              height: 50,
                            ),

                            // button login
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                defultButtonIcon(
                                  icon: Icon(
                                    Icons.logout_rounded,
                                    color: Colors.white,
                                  ),
                                  text: 'Log Out',
                                  function: () {
                                    sigOut(context);
                                    LayoutShopCuibit.get(context).currentIndex =
                                        0;
                                  },
                                  background: defaultColor,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                defultButtonIcon(
                                  icon: Icon(
                                    Icons.update,
                                    color: Colors.white,
                                  ),
                                  text: 'Up Date',
                                  function: () {},
                                  background: Colors.orangeAccent,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ))
            : Center(
                child: CircularProgressIndicator(
                  color: defaultColor,
                ),
              );
      },
      listener: (context, state) {},
    );
  }
}
