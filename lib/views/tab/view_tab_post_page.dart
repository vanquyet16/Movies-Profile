import 'package:flutter/material.dart';
import 'package:movies_profile/component/component_appbar.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF313230),
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
      // Wrap ListView.builder trong SingleChildScrollView để tránh lag
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: ListView.builder(
          // Disable scroll của ListView vì đã có SingleChildScrollView
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true, // Quan trọng khi ListView nằm trong Column
          itemCount: 10,
          itemBuilder: (context, index) {
            return ViewItem(
              index: index,
              isLiked: false,
              onLikeToggle: (isLiked) {
                print("Icon favorite được nhấn! $isLiked");
              },
            );
          },
        ),
      ),
    );
  }
}

class ViewItem extends StatefulWidget {
  final int index;
  final bool isLiked;
  final ValueChanged<bool> onLikeToggle;

  const ViewItem({
    Key? key,
    required this.index,
    required this.isLiked,
    required this.onLikeToggle,
  }) : super(key: key);

  @override
  State<ViewItem> createState() => _ViewItemState();
}

class _ViewItemState extends State<ViewItem> {
  late bool isLiked;

  @override
  void initState() {
    super.initState();
    isLiked = widget.isLiked;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFF686868),
            width: 1,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Hero(
                // Thêm Hero animation cho avatar
                tag: 'avatar_${widget.index}',
                child: CircleAvatar(
                  backgroundImage: const NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQloftq61cFe4VKJqXGU-4n7MtX18ajx3drukbn5UtCHAAvTvkguzFHal9JeUliQzW3u4w&usqp=CAU'),
                  radius: screenWidth * 0.1,
                ),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pete Davidson",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text('10 phút trước',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            "The best movie i have ever seen!!! Love It!!! ",
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            "You gotta check this movie right now dude You gotta check this movie right now dude.....",
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          ClipRRect(
            // Wrap Image trong ClipRRect để bo góc
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              'https://media.istockphoto.com/id/1396814518/vector/image-coming-soon-no-photo-no-thumbnail-image-available-vector-illustration.jpg?s=612x612&w=0&k=20&c=hnh2OZgQGhf0b46-J2z7aHbIWwq8HNlSDaNp2wn_iko=',
              width: double.infinity,
              height: screenHeight * 0.25,
              fit: BoxFit.cover,
              // Thêm loading placeholder
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return SizedBox(
                  height: screenHeight * 0.25,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Xử lý khi icon được ấn
                        setState(() {
                          isLiked = !isLiked;
                        });
                        widget.onLikeToggle(isLiked);
                      },
                      child: Icon(
                        Icons.favorite,
                        color: isLiked
                            ? Colors.red
                            : Colors.white, // Đổi màu theo trạng thái
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      "100",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Icon(Icons.star_rate, color: Colors.red),
                    SizedBox(width: 5),
                    Padding(
                      padding: EdgeInsets.only(top: 3),
                      child: Text("100", style: TextStyle(color: Colors.white)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
