import 'package:flutter/material.dart';
import 'package:movies_profile/component/component_inputSearch.dart';

import '../../component/component_appbar.dart';

class LovePage extends StatelessWidget {
  const LovePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffff313230), // Đỏ
      appBar: const CustomAppBar(
        title1: "",
        title2: "Phim yêu Thích",
      ),
      body: Container(
        // Loại bỏ Expanded không cần thiết
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: screenWidth,
              height: screenHeight * 0.06,
              // Dùng Expanded ở đúng ngữ cảnh
              child: const ComponentInputSearch(),
            ),
            Expanded(
              flex: 1,
              // Dùng Expanded ở đúng ngữ cảnh
              child: SingleChildScrollView(
                child: ListView.builder(
                  // Disable scroll của ListView vì đã có SingleChildScrollView
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true, // Quan trọng khi ListView nằm trong Column
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ViewItem(
                      index: index,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ViewItem extends StatelessWidget {
  final int index;

  const ViewItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}
