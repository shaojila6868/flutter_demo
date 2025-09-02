
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
          SliverPadding(
              padding: EdgeInsets.all(20.0),
              sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Container(
                          height: 60,
                          color: index.isEven ? Colors.blue : Colors.green,
                          child: Center(child: Text('Item $index'),),
                        );
                      },
                      childCount: 20
                  ),
              ),
          ),
        ],
      ),
    );
  }

}