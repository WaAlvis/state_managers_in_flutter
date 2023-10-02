import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_manager_in_flutter/providers/cat_provider.dart';
import 'package:state_manager_in_flutter/ui/cats_list_page.dart';

import '../providers/counter_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  static const String namePage = 'home';

  @override
  Widget build(BuildContext context) {
    CounterProvider counterProvider = context.watch<CounterProvider>();
    

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home Page'),
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
      floatingActionButton: Column(
        
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: 'btn_increment',
                onPressed: () => counterProvider.incrementCounter(),
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
              const SizedBox(
                width: 12,
              ),
              FloatingActionButton(
                heroTag: 'btn_reset',
                onPressed: () => counterProvider.resetCounter(),
                tooltip: 'Reset',
                child: const Icon(Icons.restart_alt_rounded),
              ),
            ],
          ),
          ElevatedButton.icon(
            
            
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  CatsListPage.namePage,
                );
              },
              icon: const Icon(Icons.pets),
              label: const Text('Go Cats!'))
        ],
      ),
    );
  }
}
