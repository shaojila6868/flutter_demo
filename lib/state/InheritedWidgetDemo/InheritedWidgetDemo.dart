import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class CounterProvider extends InheritedWidget {
  final int counter;
  final VoidCallback increment;

  const CounterProvider({
    super.key,
    required this.counter,
    required this.increment,
    required super.child
  });

  static CounterProvider of(BuildContext context) {
    final CounterProvider? result = context.dependOnInheritedWidgetOfExactType<CounterProvider>();
    assert(result != null, "No CounterProvider found in context");
    return result!;
  }

  @override
  bool updateShouldNotify(covariant CounterProvider oldWidget) {
    return counter != oldWidget.counter;
  }

}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _counter = 0;
  void _incrementCounter() => setState(() => _counter++);

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
        counter: _counter,
        increment: _incrementCounter,
        child: MaterialApp(
          home: Scaffold(
            appBar: AppBar(title: const Text("InheriteWidget 예제"),),
            body: const Center(child: CounterText()),
            floatingActionButton: const IncrementButton()
          )
        ));
  }
}

/// 카운터 값을 보여주는 위젯
class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    final int count = CounterProvider.of(context).counter;

    return Text(
      'Counter: $count',
      style: const TextStyle(fontSize: 30),
    );
  }
}

class IncrementButton extends StatelessWidget {

  const IncrementButton({super.key});

  @override
  Widget build(BuildContext context) {
    final VoidCallback increament = CounterProvider.of(context).increment;

    return FloatingActionButton(
      onPressed: increament,
      child: const Icon(Icons.add));
  }

}