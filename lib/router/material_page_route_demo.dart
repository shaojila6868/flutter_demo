
import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        home: HomePage(),
      ));
}

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NextPage())
              );
            }
            , child: Text("Go to Next Page")),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Next Page"),),
      body: Center(child: Text("This is the next page"),),
    );
  }
}