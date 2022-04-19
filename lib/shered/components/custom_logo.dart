import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Container(
        height: MediaQuery.of(context).size.height * .3,
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Image(
              image: AssetImage(
                'assets/images/logo.jpg',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
