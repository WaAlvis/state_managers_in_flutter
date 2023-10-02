import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_manager_in_flutter/providers/cat_provider.dart';
import 'package:state_manager_in_flutter/providers/counter_provider.dart';
import 'package:state_manager_in_flutter/ui/cats_list_page.dart';
import 'package:state_manager_in_flutter/ui/detail_cat_page.dart';

import 'home_page.dart';

void main() {
  runApp(const AppStateProvider());
}

class AppStateProvider extends StatelessWidget {
  const AppStateProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CounterProvider(),
        ),
        ChangeNotifierProvider<CatProvider>(
          create: (_) => CatProvider(),
          lazy: false,
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Managers for count',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      initialRoute: HomePage.namePage,
      routes: {
        HomePage.namePage: (_) => const HomePage(),
        CatsListPage.namePage: (_) => const CatsListPage(),
        DetailCatPage.namePage: (_) => const DetailCatPage(),
      },
    );
  }
}
