import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_manager_in_flutter/providers/cat_provider.dart';
import 'package:state_manager_in_flutter/providers/counter_provider.dart';

void main() {
  runApp(const MyApp());
}

class AppStateProvider extends StatelessWidget {
  const AppStateProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider<CatProvider>(create: (_) => CatProvider(), lazy: false,)
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => CounterProvider())],
      builder: (context, _) {
        return MaterialApp(
          title: 'State Managers for count',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
            useMaterial3: true,
          ),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {

    CounterProvider counterProvider = context.watch<CounterProvider>();
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              counterProvider.countValue.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => counterProvider.incrementCounter(),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 12,
          ),
          FloatingActionButton(
            onPressed: () => counterProvider.resetCounter(),
            tooltip: 'Reset',
            child: const Icon(Icons.restart_alt_rounded),
          ),
        ],
      ),
    );
  }
}
