import 'package:flutter/material.dart';

import '../../component/component_appbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffff313230),
      // Ví dụ mã màu đỏ bằng RGB
      appBar: CustomAppBar(
        title1: "",
        title2: "Trang Cá Nhân",
        iconData: const Icon(
          Icons.logout,
          color: Color(0xFF19AFDF),
          size: 30,
        ),
        onTap: () {},
      ),
    );
  }
}
