import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends  StatelessWidget {
  MyApp({super.key});

  final nativeBridge = NativeBridge();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Platform Channel Example'),),
        body: Center(
          child: FutureBuilder<String>(
              future: nativeBridge.getNativeData(),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.done) {
                  return Text(snapshot.data ?? 'No data');
                } else {
                  return CircularProgressIndicator();
                }
              }),
        ),
      ),
    );
  }
}

class NativeBridge {
  static const _channel = MethodChannel('com.example/mychannel');

  Future<String> getNativeData() async {
    try {
      final result = await _channel.invokeMethod<String>('getData');
      return result ?? 'No data';
    } on PlatformException catch (e) {
      return 'Failed : ${e.message}';
    }
  }
}