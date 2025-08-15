

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FittedBox'),),
      body: Container(
        width: 200,
        height: 200,
        color: Colors.green,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text('Flutter', style: TextStyle(fontSize: 60),),
        ),
      ),
    );
  }
}