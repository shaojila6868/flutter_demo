
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MainPage(),));
}

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      color: index.isEven ? Colors.amber : Colors.blue,
                      alignment: Alignment.center,
                      child: Text('Item $index')
                    );
                  }
              ),
              itemExtent: 80) // 아이템 높이 고정
        ],
      ),
    );
  }

}