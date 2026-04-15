import 'package:ejaarah_app/View/Home/home.dart';
import 'package:ejaarah_app/View/Profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserTab extends StatefulWidget {
  const UserTab({super.key});

  @override
  State<UserTab> createState() => _UserTabState();
}

class _UserTabState extends State<UserTab> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            activeColor: Colors.redAccent.shade700,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
              BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'profile')
            ]),
        tabBuilder: ((context, index) {
          switch (index) {
            case 0:
              return CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(child: HomePage());
              });
            default:
              return CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(child: ProfilePage());
              });
          }
        }));
  }
}