import 'package:flutter/material.dart';

class favoritScreen extends StatelessWidget {
  const favoritScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'favorit Screen',
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
