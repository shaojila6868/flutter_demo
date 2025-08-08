
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewUI extends ListView{

  List<User> userList = [];

  ListViewUI({super.key}) {
    for(int i =0; i< 5; i++) {
      userList.add(User("jicheng$i" , 38 + i));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, idx) {
          var item = userList[idx];
          return Container(
            color: idx % 2 == 0 ? Colors.lightBlue : Colors.transparent,
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item.name),
                Text(item.age.toString())
              ],
            ),
          );
        });
  }
}

class User {
  late String name;
  late int age;

  User(this.name, this.age);
}