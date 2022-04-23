import 'package:flutter/material.dart';

class settingsScreen extends StatelessWidget {
  const settingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'settings Screen',
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
