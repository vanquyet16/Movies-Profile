// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movies_profile/component/component_appbar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFF313230),
        appBar:
            CustomAppBar(title1: "", title2: "", iconData: null, onTap: () {}),
        body: const SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [SearchWidget(), ListSearch()],
          ),
        ) // Đỏ
        );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 20),
      decoration: BoxDecoration(
        color: const Color(0xFFFF313230),
        border: Border.all(
          color: Colors.white,
          width: 0.5,
          style: BorderStyle.solid,
        ),
        boxShadow: const [],
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 10),
        child: TextField(
          style: TextStyle(color: Colors.white),
          // controller: controller,
          decoration: InputDecoration(
            hintText: "Nhập tên phim",
            hintStyle: TextStyle(color: Colors.white),
            border: InputBorder.none,
            suffixIcon: IconButton(
              // focusColor: Colors.blue,
              // hoverColor: Colors.blue,
              // highlightColor: Colors.blue,
              splashRadius: 30,
              autofocus: true,
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            prefixIconConstraints: BoxConstraints(minWidth: 30),
          ),
        ),
      ),
    );
  }
}

class ListSearch extends StatelessWidget {
  const ListSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle styleTextContent = TextStyle(
        color: Colors.white, fontSize: 15, fontStyle: FontStyle.italic);
    return SizedBox(
      height: 700,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      width: 150,
                      height: 250,
                      color: Colors.blue,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Aaaa",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: const Color(0xFFDFD719),
                          ),
                        ),
                        Text("Điểm: 9/10", style: styleTextContent),
                        Text("Nội dung111", style: styleTextContent),
                      ],
                    ),
                  )
                ],
              ),
            );
          })),
    );
  }
}
