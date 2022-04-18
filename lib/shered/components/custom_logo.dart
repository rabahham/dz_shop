import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30),
      child: Container(
        height: MediaQuery.of(context).size.height * .3,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image(
              //image: AssetImage('assets/images/annonce_dz.png'),
              image: AssetImage('assets/images/logo.png'),
            ),
            // Positioned(
            //   bottom: 0,
            //   // child: Text(
            //   //   'Bati Sit',
            //   //   style: TextStyle(fontFamily: 'Pacifico', fontSize: 25),
            //   // ),
            // )
          ],
        ),
      ),
    );
  }
}
