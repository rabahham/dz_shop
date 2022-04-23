import 'package:flutter/material.dart';

class searchScreen extends StatelessWidget {
  const searchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'search Screen',
          // style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
