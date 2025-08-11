
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const SafeAreaDemo());
}

class SafeAreaDemo extends StatelessWidget {
  const SafeAreaDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(title: 'SafeArea Demo',
      home: Scaffold(
        appBar: AppBar(title: const Text('SafeArea Demo Scaffold')),
        body: Column(
          children: [
            Expanded(child: Container(
              color: Colors.red,
              child: Column(
                children: [
                  Text('SafeArea 없음', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  Text('노치나 상태바에 겹칠 수 있습니다.')
                ],
              ),
            )),
            Expanded(
              child:
              Container(color:Colors.green,
                  child: SafeArea(
                      child: Column(children: [
                        Text(
                          'SafeArea 적용',
                          style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text('노치, 상태바, 홈버튼 영역을 피해 표시됩니다'),
                      ],))),)
          ],
        ),
      )
      );
  }
}