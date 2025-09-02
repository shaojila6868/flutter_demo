
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
          SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: _MyHeadeDelegate()
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(title: Text('Item $index'),),
                childCount: 30
              )
          )
        ],
      ),
    );
  }
}

class _MyHeadeDelegate extends SliverPersistentHeaderDelegate {
  
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.blue,
      child: Center(child: Text('Persistent Header',),),
    );
  }
  
  @override
  double get maxExtent => 300; // 최대 높이
  @override
  double get minExtent => 60; // 최소 높이
  
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}