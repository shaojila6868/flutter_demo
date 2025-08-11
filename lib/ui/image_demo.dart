
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: LocalImageDemo(),
  ));
}

class LocalImageDemo extends StatelessWidget {
  const LocalImageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('로컬 이미지 예제'),),
      body: Center(
        child: Image.asset(
          'assets/images/lgthinq_1.png',
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}