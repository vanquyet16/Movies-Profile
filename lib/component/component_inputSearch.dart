import 'package:flutter/material.dart';

class ComponentInputSearch extends StatelessWidget {
  const ComponentInputSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white), // Đường viền trắng
      ),
      child: const Row(
        mainAxisAlignment:
            MainAxisAlignment.center, // Căn giữa các phần tử trong Row
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none, // Bỏ gạch chân mặc định
                hintText: "Tìm kiếm",
                hintStyle: TextStyle(
                  color: Colors.white,
                ),

                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
              style: TextStyle(
                color: Colors.white,
                // Màu chữ khi người dùng nhập vào
              ),
            ),
          ),
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}
