import 'package:flutter/material.dart';

class CatsListPage extends StatelessWidget {
  const CatsListPage({super.key});

  static const String namePage = 'cats_list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: List.generate(10, (index) => Text('cat $index')),
    ));
  }
}
