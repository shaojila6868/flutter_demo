import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
          create: (_) => Counter(),
          child: const MyApp(),));
}

class Counter with ChangeNotifier {
  int count = 0;
  void increment() {
    count++;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Consumer Example'),),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<Counter>(
              builder: (context, counter, _) {
                return Text('Count: ${counter.count}',
                          style: const TextStyle(fontSize: 30),);
              },
            ),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: () => context.read<Counter>().increment(),
                child: const Text('Increment'))
          ],
        ),
      ),
    );
  }
}