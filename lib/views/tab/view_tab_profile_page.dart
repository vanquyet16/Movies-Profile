import 'package:flutter/material.dart';
import 'package:movies_profile/public/Color/AppColor.dart';

import '../../component/component_appBar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
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
      body: Column(children: [
        const Expanded(child: _ViewProfile()),
        SizedBox(
          height: screenHeight * 0.42,
          child: TabExampleWithoutScaffold(),
        ),
      ]),
    );
  }
}

class _ViewProfile extends StatefulWidget {
  const _ViewProfile({Key? key}) : super(key: key);

  @override
  _ViewProfileState createState() => _ViewProfileState();
}

class _ViewProfileState extends State<_ViewProfile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundColor: AppColor.primaryColor,
          backgroundImage: NetworkImage(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQloftq61cFe4VKJqXGU-4n7MtX18ajx3drukbn5UtCHAAvTvkguzFHal9JeUliQzW3u4w&usqp=CAU',
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Pete Davidson',
          style: TextStyle(
            color: AppColor.whiteColor,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          'Ngày sinh: 01-10-2000',
          style: TextStyle(
            color: AppColor.whiteColor,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          'Giới tính: Nam',
          style: TextStyle(
            color: AppColor.whiteColor,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Tôi yêu phim chiếu rạp việt nam?',
          style: TextStyle(
            color: AppColor.whiteColor,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                      text: "96 ",
                      style: TextStyle(
                          color: AppColor.textColorPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: "Đang theo dõi",
                      style: TextStyle(
                          color: AppColor.textColorPrimary,
                          fontSize: 15,
                          fontStyle: FontStyle.normal)),
                ],
              ),
            ),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                      text: "96 ",
                      style: TextStyle(
                          color: AppColor.textColorPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: "Người theo dõi",
                      style: TextStyle(
                          color: AppColor.textColorPrimary,
                          fontSize: 15,
                          fontStyle: FontStyle.normal)),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

class TabExampleWithoutScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Số lượng tab
      child: Column(
        children: [
          // Header thông tin
          Container(
            color: AppColor.primaryColor,
            child: const Column(
              children: [
                SizedBox(height: 8),
                TabBar(
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.blue,
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  tabs: [
                    Tab(text: 'Bài đăng'),
                    Tab(text: 'Bạn bè'),
                  ],
                ),
              ],
            ),
          ),
          // Nội dung tab
          Expanded(
            child: TabBarView(
              children: [
                // Nội dung tab Bài đăng
                PostTabContent(),
                // Nội dung tab Bạn bè
                FriendTabContent(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PostTabContent extends StatelessWidget {
  const PostTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        PostItem(),
      ],
    );
  }
}

class FriendTabContent extends StatelessWidget {
  const FriendTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Danh sách bạn bè',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}

class PostItem extends StatelessWidget {
  const PostItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Container(),
    );
  }
}
