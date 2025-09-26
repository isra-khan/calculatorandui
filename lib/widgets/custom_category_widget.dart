import 'package:flutter/material.dart';

class CustomCategoryWidget extends StatelessWidget {
  String categoryImagePath;
  String categoryTitle;
  CustomCategoryWidget({
    required this.categoryImagePath,
    required this.categoryTitle,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          child: Image.asset(
            categoryImagePath,
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          radius: 35,
        ),
        SizedBox(height: 5),
        Text(
          categoryTitle,
          style: TextStyle(
            color: Color(0xff21003D),
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
