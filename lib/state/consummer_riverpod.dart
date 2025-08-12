
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp (
    const ProviderScope(child: MyApp())
  );
}

final counterProvider = StateProvider<int>((ref) => 0);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Riverpod Consumer Example'),),
        body: ListView(
          children: [
            Center(
              child: Consumer(
                  builder: (context, ref, child) {
                    final count = ref.watch(counterProvider);
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Count: $count', style:  const TextStyle(fontSize: 30),),
                        const SizedBox(height: 20,),
                        ElevatedButton(onPressed: () => ref.read(counterProvider.notifier).state++,
                            child: const Text('Increment')),
                      ],
                    );
                  }),
            ),
            Container (
              color: Colors.green,
              child: const Text('List Item 2'),
            )
          ],
        ),
      ),
    );
  }
}