import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(100.0); // Set your desired height here

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
      child: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 32,
        leading: Container(
          decoration: BoxDecoration(
            color: Color(0xffF2F2F2),
            shape: BoxShape.circle,
          ),
          child: Image.asset('assets/icons/menu.png'),
        ),
        centerTitle: true,
        title: Container(child: Image.asset('assets/icons/logo.png')),
        actions: [
          Container(child: Image.asset('assets/icons/girl_header.png')),
        ],
      ),
    );
  }
}
