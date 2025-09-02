
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Mainpage(),));
}

class Mainpage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 150,
            backgroundColor: Colors.red,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Sliver Demo'),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              height: 100,
              color: Colors.blue,
              child: Center(child: Text('나는 일반 위젯'),),
            ),
          ),

          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(title: Text('Item $index'),)
              ))
        ],
      ),
    );
  }

}