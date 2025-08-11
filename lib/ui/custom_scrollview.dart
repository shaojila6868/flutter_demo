import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return scrollAppBar();
  }
}

/**
 * 스크롤 시 appBar가 작아지고, 위까지 올라갔을 시 전체 app가 나타나는 케이스
 *  속성	타입	기본값	설명
    left	bool	TRUE	왼쪽 여백 포함 여부
    top	bool	TRUE	상단 여백 포함 여부
    right	bool	TRUE	오른쪽 여백 포함 여부
    bottom	bool	TRUE	하단 여백 포함 여부
    minimum	EdgeInsets	EdgeInsets.zero	최소 padding
    maintainBottomViewPadding	bool	FALSE	키보드가 올라올 때 하단 padding 유지 여부
 */

Widget scrollAppBar() {
  return MaterialApp(
    title: 'Floating App Bar',
    home: Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(title: Text('Floating App Bar'),
          pinned: true,
          flexibleSpace: Placeholder(),
          expandedHeight: 200,),
          SliverList.builder(
              itemBuilder: (context, index) =>
                ListTile(title: Text('Item #$index'),),
            itemCount: 50,)
        ],
      ),
    ),
  );
}