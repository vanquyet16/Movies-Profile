import 'package:flutter/material.dart';
import 'package:movies_profile/views/tab/view_tab_post_page.dart';
import 'package:movies_profile/views/tab/view_tab_home_page.dart';
import 'package:movies_profile/views/tab/view_tab_love_page.dart';
import 'package:movies_profile/views/tab/view_tab_profile_page.dart';

class ButtomBar extends StatefulWidget {
  const ButtomBar({super.key});

  @override
  State<ButtomBar> createState() => _ButtomBarState();
}

class _ButtomBarState extends State<ButtomBar> {
  int currentPageIndex = 0;
  final tabs = [
    const Scaffold(
      body: MyHomePage(),
    ),
    const Scaffold(
      body: PostPage(),
    ),
    const Scaffold(
      body: LovePage(),
    ),
    const Scaffold(
      body: ProfilePage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavigationBar(
          backgroundColor: Color(0xFF6D736D),
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: Colors.amber,
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.menu_book),
              label: 'Bài Đăng',
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite),
              label: 'Yêu Thích',
            ),
            NavigationDestination(
              icon: Icon(Icons.account_circle),
              label: 'Hồ Sơ',
            ),
          ],
        ),
        body: tabs[currentPageIndex]);
  }
}
