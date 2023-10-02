import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_manager_in_flutter/providers/cat_provider.dart';

class CatsListPage extends StatelessWidget {
  const CatsListPage({super.key});

  static const String namePage = 'cats_list';

  @override
  Widget build(BuildContext context) {
    CatProvider catProvider = context.watch<CatProvider>();

    return Scaffold(
      body: ListView.builder(
        itemCount: catProvider.catList.length,
        itemBuilder: (BuildContext context, int i) {
          return Image.network(catProvider.catList[i].url);
        },
      ),
    );
  }
}
