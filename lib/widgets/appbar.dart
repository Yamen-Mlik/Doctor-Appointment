import 'package:flutter/material.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      height: 80, // Set the desired height
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Image.asset(
          "images/logo.png",
          width: 150,
          height: 150, // Increase the height of the image
        ),
        leadingWidth: 250,
        centerTitle: true,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(150); // Set the same height as the AppBar
}
