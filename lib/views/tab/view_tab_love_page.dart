import 'package:flutter/material.dart';

import '../../component/component_appbar.dart';

class LovePage extends StatelessWidget {
  const LovePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF313230), // Đỏ
      appBar: CustomAppBar(
        title1: "",
        title2: "Phim yêu Thích",
        iconData: const Icon(
          Icons.bookmark_border,
          color: Color(0xFF19AFDF),
          size: 30,
        ),
        onTap: () {
          print("love");
        },
      ),
    );
  }
}
