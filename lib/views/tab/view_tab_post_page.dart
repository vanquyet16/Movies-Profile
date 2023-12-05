import 'package:flutter/material.dart';
import 'package:movies_profile/component/component_appbar.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF313230), // Đỏ
      appBar: CustomAppBar(
        title1: "",
        title2: "Bài Đăng Bạn Bè",
        iconData: const Icon(
          Icons.person_add,
          color: Color(0xFF19AFDF),
          size: 30,
        ),
        onTap: () {},
      ),
    );
  }
}
