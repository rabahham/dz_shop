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

    File? file; // for photo de profile

    // string for displaying the error Message
    String? errorMessage;

    // function get camera photo profile

    Future pickercameraprofile(ImageSource source) async {
      try {
        final mygfile = await ImagePicker().pickImage(source: source);
        if (mygfile == null) {
          return;
        }

        // setState(() {
        //   //final imageTemp = File(mygfile.path);
        //   file = File(mygfile.path);
        // });
        // ignore: nullable_type_in_catch_clause
      } on PlatformException catch (e) {
        print('Failed to pick image: $e');
      }
    }

    return BlocConsumer<LayoutShopCuibit, LayoutShopState>(
      builder: (context, state) {
        return Scaffold(
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
                              border: Border.all(color: defaultColor, width: 5),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(100),
                              ),
                            ),
                            child: ClipOval(
                              child: file != null
                                  ? Image.file(
                                      file,
                                      width: 170,
                                      height: 170,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiEpPw-lF6pxba72HeJW7ovks7g6k14Izj-A&usqp=CAU',
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
                                scaffoldKey.currentState?.showBottomSheet(
                                  (context) => Container(
                                    height: 140,
                                    //color: Colors.amber,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        ListTile(
                                          leading: Icon(Icons.camera),
                                          title: Text('camera'),
                                          onTap: () {
                                            pickercameraprofile(
                                                ImageSource.camera);
                                            Navigator.pop(context);
                                          },
                                        ),
                                        Divider(),
                                        ListTile(
                                          leading: Icon(Icons.photo_album),
                                          title: Text('gallery'),
                                          onTap: () {
                                            pickercameraprofile(
                                                ImageSource.gallery);
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
                            LayoutShopCuibit.get(context).currentIndex = 0;
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
        ));
      },
      listener: (context, state) {},
    );
  }
}
