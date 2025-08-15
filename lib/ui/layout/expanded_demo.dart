
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyPage(),
  ));
}

class MyPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('expanded'),),
      body: Row(
        children: [
          Container(width: 50, height: 50, color: Colors.blue,),
          Expanded(
              flex: 2,
              child: Container(height: 50, color: Colors.red,)),
          Expanded(
              flex: 1,
              child: Container(height: 50, color: Colors.green,))
        ],
      ),
    );
  }

}