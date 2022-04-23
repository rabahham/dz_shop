import 'package:flutter/material.dart';

class cateogrieScreen extends StatelessWidget {
  const cateogrieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'cateogrie Screen',
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
