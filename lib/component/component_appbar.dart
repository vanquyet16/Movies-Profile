import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title1;
  final String title2;
  final Icon iconData;
  final void Function() onTap;

  const CustomAppBar({
    Key? key,
    required this.title1,
    required this.title2,
    required this.iconData,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Row(
        children: [
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: title1,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFDFD719),
                ),
              ),
              TextSpan(
                text: title2,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
          ),
          const Spacer(),
          IconButton(
            splashRadius: 20,
            icon: iconData,
            onPressed: onTap,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
