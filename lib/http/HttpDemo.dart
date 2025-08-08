import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  String result = '';

  void fetchData() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
    final response = await http.get(url);


    if(response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        result = '가져온 데이터: ${data['title']}';
      });
    } else {
      setState(() {
        result = 'Error: ${response.statusCode}';
      });
    }


  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HttpDemo',
      home: Scaffold(
        appBar: AppBar(title: Text('HttpDemo')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(result, style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(onPressed: fetchData, child: Text('데이터 가져오기'))
          ],
        )),
      );
  }
}