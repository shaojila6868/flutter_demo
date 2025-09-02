

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MainPage(),));
}

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SliverFillRemaining Demo"),),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('SliverFillRemaining Demo SliverAppBar'),
            floating: true,
          ),
          SliverList(delegate: SliverChildBuilderDelegate(
            (context, index) => ListTile(title: Text("Item $index"),),
            childCount: 35 //스크롤 불가능하게 하려면 5로 해서 결과 보거라
          )),
          SliverFillRemaining(
            hasScrollBody: false,
            child:SizedBox(height: 200,
              child: Container(
                color: Colors.blue,
                child: Center(
                  child: Text("남긍 공간을 채움"),
                ),
            ),)
          )
        ],
      ),
    );
  }
}