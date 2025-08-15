
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyPage()));
}

class MyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('carousel view'),),
      body:
          SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 500,
                child: CarouselView(itemExtent: 300,
                    children: [
                      Container(color: Colors.green,child: Text('text 1'),),
                      Container(color: Colors.red,child: Text('text 2'),),
                      Container(color: Colors.blue,child: Text('text 3'),)
                    ]
                ),
              ),
              SizedBox(height: 50,),
              SizedBox(
                height: 500,
                child: CarouselView.weighted(
                    flexWeights: const <int>[1, 7, 1],
                    children: [
                      Container(color: Colors.green,child: Text('text 1'),),
                      Container(color: Colors.red,child: Text('text 2'),),
                      Container(color: Colors.blue,child: Text('text 3'),)
                    ]
                ),
              )
            ],),
          )

    );
  }
}