
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: LocalImageDemo(),
  ));
}

class LocalImageDemo extends StatelessWidget {
  const LocalImageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('로컬 이미지 예제'),),
      body: ListView(
        children: [
          Center(
            child: Image.asset(
              'assets/images/lgthinq_1.png',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Image.network(
                'http://gips0.baidu.com/it/u=3602773692,1512483864&fm=3028&app=3028&f=JPEG&fmt=auto?w=960&h=1280',
                width: 200,
                height: 200,
                fit: BoxFit.cover,),
          ),
          Center(
            child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/loading.gif',
                image: 'http://gips0.baidu.com/it/u=3602773692,1512483864&fm=3028&app=3028&f=JPEG&fmt=auto?w=960&h=1280',
                fadeInDuration: Duration(seconds: 1),
                width: 300,
                height: 200,
                fit: BoxFit.cover,),
          )
        ],
      )


    );
  }
}