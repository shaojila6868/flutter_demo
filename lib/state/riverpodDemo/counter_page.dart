
import 'package:flutter/material.dart';
import 'package:flutter_demo/state/riverpodDemo/counter_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterPage extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Counter Page')),
      body: Center(
        child: Text('Counter: $count', style: TextStyle(fontSize: 32)),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(counterProvider.notifier).state++;
          },
      child: Icon(Icons.add),),
    );
  }

}
