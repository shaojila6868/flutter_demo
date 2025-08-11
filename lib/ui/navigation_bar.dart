import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 하단 바:
 *  Android : NavigationBar 를 사용하고
 *  IOS 일때는 CupertinoTabBar를 사용한다
 *
 */

void main() {
  runApp(MaterialApp(
    title: 'NavigationBar',
    home: NavigationBarExample(),
  ));
}

class NavigationBarExample extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _NavigationBarExampleState();
}

class _NavigationBarExampleState extends State<NavigationBarExample> {

  int _seletedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Page $_seletedIndex'),),
      bottomNavigationBar: NavigationBar(
          selectedIndex: _seletedIndex,
          onDestinationSelected: (index) => setState(() => _seletedIndex = index),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home', selectedIcon: Icon(Icons.home),),
            NavigationDestination(icon: Icon(Icons.favorite_outline), label: 'Favorites', selectedIcon: Icon(Icons.favorite),),
            NavigationDestination(icon: Icon(Icons.settings_outlined), label: "Settings", selectedIcon: Icon(Icons.settings),)
          ]),
    );
  }
}


class CupertinoTabBarExample extends StatefulWidget {
  @override
  State<CupertinoTabBarExample> createState() => _CupertinoTabBarExampleState();
}

class _CupertinoTabBarExampleState extends State<CupertinoTabBarExample> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Settings',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return Center(child: Text('Page $index'));
      },
    );
  }
}