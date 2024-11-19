import 'package:flutter/material.dart';
import 'package:movies_profile/component/component_appBar.dart';
import 'package:movies_profile/component/component_buttonGroup.dart';
import 'package:movies_profile/component/component_inputSearch.dart';
import 'package:movies_profile/public/Color/AppColor.dart';

class LovePage extends StatelessWidget {
  const LovePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.primaryColor, // Đỏ
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: screenWidth,
      height: screenHeight * 0.2,
      child: Container(
        padding: const EdgeInsets.only(bottom: 15),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColor.secondaryColor,
              width: 1,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Flexible(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        'https://media.istockphoto.com/id/1396814518/vector/image-coming-soon-no-photo-no-thumbnail-image-available-vector-illustration.jpg?s=612x612&w=0&k=20&c=hnh2OZgQGhf0b46-J2z7aHbIWwq8HNlSDaNp2wn_iko=',
                        height: screenHeight * 0.1,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                      child: Wrap(
                        direction: Axis.vertical,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 5,
                        children: [
                          const Text(
                            "Transformer: Rise of the beast ",
                            style: TextStyle(
                              color: AppColor.textColorSecondary,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Text(
                          //   "Điểm: ",
                          //   style: TextStyle(
                          //     color: AppColor.textColorPrimary,
                          //     fontSize: 16,
                          //     fontWeight: FontWeight.bold,
                          //   ),

                          // ),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                    text: "Điểm: ",
                                    style: TextStyle(
                                        color: AppColor.textColorPrimary,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: "8.5/10",
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
                                    text: "Trạng thái: ",
                                    style: TextStyle(
                                        color: AppColor.textColorPrimary,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: "Đã xem",
                                    style: TextStyle(
                                        color: AppColor.textColorPrimary,
                                        fontSize: 15,
                                        fontStyle: FontStyle.normal)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ComponentButtonGroup(title: "Sửa"),
                    ComponentButtonGroup(
                      title: "Chia sẻ",
                      width: 150,
                    ),
                    ComponentButtonGroup(title: "Xoá"),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
