import 'package:dz_shop/screens/register/shop_register_screen.dart';
import 'package:dz_shop/shered/components/components.dart';
import 'package:dz_shop/shered/components/custom_logo.dart';
import 'package:dz_shop/shered/styles/colors.dart';
import 'package:flutter/material.dart';

class ShopLoginScreen extends StatefulWidget {
  ShopLoginScreen({Key? key}) : super(key: key);

  @override
  State<ShopLoginScreen> createState() => _ShopLoginScreenState();
}

class _ShopLoginScreenState extends State<ShopLoginScreen> {
  final _formKey = GlobalKey<FormState>();

  // passwordVisible
  var passwordVisible = true;

  // editing controller
  final TextEditingController emailController = new TextEditingController();

  final TextEditingController passwordController = new TextEditingController();

  // string for displaying the error Message
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
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
                CustomLogo(),

                SizedBox(
                  height: 20,
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
                passwordField(
                  obscureText: passwordVisible,
                  controller: passwordController,
                  hintText: 'Password',
                  prefixIconicon: Icon(Icons.vpn_key),
                  function: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                ),

                SizedBox(
                  height: 20,
                ),

                // // button login
                defultButton(
                  text: 'Log In',
                  function: () {
                    // signIn(emailController.text, passwordController.text);
                    if (_formKey.currentState!.validate()) {}

                    _formKey.currentState!.validate();
                  },
                  background: defaultColor,
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Crée un compte? ",
                        style: TextStyle(
                            //  color: defaultColor.withOpacity(0.7),
                            // fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      GestureDetector(
                        onTap: () {
                          navigatTo(context, ShopRegisterScreen());
                        },
                        child: Text(
                          "DzShop ",
                          style:
                              Theme.of(context).textTheme.headline6?.copyWith(
                                    // copyWith for modfai,
                                    color: defaultColor.withOpacity(0.6),
                                  ),
                        ),
                      ),
                    ]),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}













// /////////////////////
// ///




