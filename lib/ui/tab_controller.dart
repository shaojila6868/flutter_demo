import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home:const MyTabControllerDemo(),));
}

class MyTabControllerDemo extends StatefulWidget {
  const MyTabControllerDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyTabController();
  }
}

class _MyTabController extends State<MyTabControllerDemo>
  with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabController 예제'),
        bottom: TabBar(
           controller: _tabController,
            tabs: const [
              Tab(icon: Icon(Icons.home), text: '홈',),
              Tab(icon: Icon(Icons.search), text: '검색',),
              Tab(icon: Icon(Icons.person), text: '프로필',)
            ]),
      ),
      body: TabBarView(
          controller: _tabController,
          children: const [
            Center(child: Text('홈 화면'),),
            Center(child: Text('검색 화면'),),
            Center(child: Text('프로필 화면'),)
          ]),
    );
  }

}