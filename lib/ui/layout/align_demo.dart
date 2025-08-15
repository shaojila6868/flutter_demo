import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    home: Scaffold(body: MyPage(),
    backgroundColor: Colors.amber),
  ));
}

class MyPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        align_1(),
        align_2(),
        align_3()
      ],
    );
  }

  ///Alignment.topRight 의 방식의 사용방식
  Widget align_1() {
    return Center( ///Center은 기본 부모 widget의 전체 크기를 차지하며, 크기에서 중간 정렬으로 보여준다
      child: commonContainer(///widget의 크기,높아,margin,padding 등을 설정 할 수 있다.
        color: Colors.blue,
        child: commonAlign(
          alignment: Alignment.topRight,///여기를 보라 align 방식을 정해준다
        ),
      ),
    );
  }

  Widget align_2() {
    return Center(
      child: commonContainer(
        color: Colors.deepPurpleAccent,
        child: commonAlign (
          /**
           * 	•	x, y 값은 -1.0 ~ 1.0 범위
              •	x = -1.0 → 왼쪽
              •	x = 0.0 → 수평 중앙
              •	x = 1.0 → 오른쪽
              •	y = -1.0 → 위
              •	y = 0.0 → 수직 중앙
              •	y = 1.0 → 아래
           */
          alignment: Alignment(0.2, 0.6),
        )
      ),
    );
  }

  Widget align_3() {
    return Center(
      child: commonContainer(
          color: Colors.green,
          child: commonAlign(
            /***
             * 	•	FractionalOffset(dx, dy)에서 dx, dy는 0.0 ~ 1.0 범위가 기본
                •	(0.0, 0.0) → 부모 위젯의 왼쪽 위
                •	(0.5, 0.5) → 부모 위젯의 중앙
                •	(1.0, 1.0) → 부모 위젯의 오른쪽 아래
             */
            alignment: FractionalOffset(0.2, 0.6),
          )
      ),
    );
  }

  Container commonContainer({Widget? child, Color? color}) {
    return Container(
      height: 120,
      width: 120,
      /**
       * padding: EdgeInsets.fromLTRB(10, 20, 30, 40), ///LTRB를 사용하여 4개 방향을 다 지정해줘야 한다
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),///수직, 수평 방향으로 여백 지정
       */
      padding: EdgeInsets.all(10),///모든 방향 10.속성은 모두 EdgeInsets 사용하는거 같다
      margin: EdgeInsets.only(left: 30),///only를 사용하여 이렇게 어느방향만 할 것인지 정할 수 있다
      color: color,
      child: child,
    );
  }

  Align commonAlign({required Alignment alignment}) {
    return Align(
      alignment: alignment,
      child: FlutterLogo(
        size: 60,
      ),
    );
  }

}


