

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Aspect'),),
      body: AspectRatioExample2(),
    ),
  ));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: case_2(),
    );
  }

  Widget case_1() {
    return AspectRatio(
      aspectRatio: 1 / 1, /// '/'를 사용시는 가로:세로 비율이다
      child: Container(
        color: Colors.blue,
      ),
    );
  }

  Widget case_2() {
    return Container(
      height: 200,
      child: AspectRatio(
        aspectRatio: 1 / 1, // 정사각형
        child: Container(color: Colors.red),
      ),
    );
  }
}

class AspectRatioExample extends StatelessWidget {
  const AspectRatioExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      width: 100.0,
      height: 100.0,
      child: AspectRatio(
        aspectRatio: 2.0,
        child: Container(width: 100.0, height: 50.0, color: Colors.green),
      ),
    );
  }
}

class AspectRatioExample2 extends StatelessWidget {
  const AspectRatioExample2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      width: 100.0,
      height: 100.0,
      child: AspectRatio(
        aspectRatio: 0.5,
        child: Container(width: 20.0, height: 20.0, color: Colors.green),
      ),
    );
  }
}
