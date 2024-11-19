import 'package:flutter/material.dart';
import 'package:movies_profile/public/Color/AppColor.dart';

import '../../component/component_appBar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      // Ví dụ mã màu đỏ bằng RGB
      appBar: CustomAppBar(
        title1: "",
        title2: "Trang Cá Nhân",
        iconData: const Icon(
          Icons.logout,
          color: AppColor.iconBlueColor,
          size: 30,
        ),
        onTap: () {},
      ),
    );
  }
}
