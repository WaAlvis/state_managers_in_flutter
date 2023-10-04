import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_manager_in_flutter/providers/cat_provider.dart';

class CatsListPage extends StatelessWidget {
  const CatsListPage({super.key});

  static const String namePage = 'cats_list';

  @override
  Widget build(BuildContext context) {
    PetsProvider catProvider = context.watch<PetsProvider>();

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/pet_not_found.jpg'),
          ),
          SizedBox(width: 20,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          itemCount: catProvider.catList.length,
          itemBuilder: (BuildContext context, int i) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                fit: BoxFit.cover,
                height: 300,
                width: double.infinity,
                placeholder:
                    const AssetImage('assets/images/pet_not_found.jpg'),
                image: NetworkImage(catProvider.catList[i].url),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            height: 12,
          ),
        ),
      ),
    );
  }
}
