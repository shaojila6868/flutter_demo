
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MainPage(),));
}

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CustomScrollView(
      slivers: [
        SliverList(delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return ListTile(title: Text("index $index"),);
            },
          childCount: 20
        )),
        SliverFillViewport(
            delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    color: index.isEven ? Colors.blue : Colors.green,
                    child: Center(
                      child: Text('Page $index', style: TextStyle(fontSize: 32, color: Colors.white),),
                    ),
                  );
                },
              childCount: 3,
            ),
        ),
      ],
      )
    );
  }

}