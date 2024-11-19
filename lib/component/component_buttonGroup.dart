import 'package:flutter/material.dart';
import 'package:movies_profile/public/Color/AppColor.dart';

class ComponentButtonGroup extends StatelessWidget {
  const ComponentButtonGroup({
    super.key,
    required this.title,
    this.width = 90,
  });

  final String title;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.buttonGroupColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        onPressed: () {},
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
