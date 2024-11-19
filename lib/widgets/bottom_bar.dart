import 'package:flutter/material.dart';
import 'package:movies_profile/public/Color/AppColor.dart';
import 'package:movies_profile/views/tab/view_tab_post_page.dart';
import 'package:movies_profile/views/tab/view_tab_home_page.dart';
import 'package:movies_profile/views/tab/view_tab_love_page.dart';
import 'package:movies_profile/views/tab/view_tab_profile_page.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final PageController _pageController = PageController();
  int currentPageIndex = 0;

  final List<Widget> tabs = [
    const MyHomePage(),
    const PostPage(),
    const LovePage(),
    const ProfilePage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      currentPageIndex = index;
    });
    _pageController.jumpToPage(index); // Điều hướng ngay lập tức
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(), // Tắt vuốt ngang
        children: tabs,
      ),
      bottomNavigationBar: Container(
        color: AppColor.secondaryColor, // Màu nền của thanh điều hướng
        child: SafeArea(
          top: false,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCustomNavItem(
                  icon: Icons.home,
                  label: 'Home',
                  index: 0,
                ),
                _buildCustomNavItem(
                  icon: Icons.menu_book,
                  label: 'Bài Đăng',
                  index: 1,
                ),
                _buildCustomNavItem(
                  icon: Icons.favorite,
                  label: 'Yêu Thích',
                  index: 2,
                ),
                _buildCustomNavItem(
                  icon: Icons.account_circle,
                  label: 'Hồ Sơ',
                  index: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final bool isSelected = currentPageIndex == index;
    return GestureDetector(
      onTap: () => _onTabTapped(index),
      child: Container(
        color: Colors.transparent, // Không cần nền xanh lá
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.amber : Colors.white,
              size: isSelected ? 30 : 24,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.amber : Colors.white,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
