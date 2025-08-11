
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyDrawerDemo(),));
}

class MyDrawerDemo extends StatelessWidget {
  const MyDrawerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Drawer 예제'),),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text('메뉴 헤더', style: TextStyle(color: Colors.white),
              )),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('홈'),
              onTap: () => Navigator.pop(context), //Drawer 닫기
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('설정'),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: Center(child: Text('메인 화면'),),
    );
  }

}