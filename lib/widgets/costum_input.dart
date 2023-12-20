import 'package:flutter/material.dart';

class CostumInput extends StatelessWidget {
  CostumInput(
      {super.key,
      required this.name,
       this.icon,
      this.isPassword = false,
      this.controller});

  String name;
  Icon? icon;
  bool isPassword;

  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return

      TextField(
        controller: controller,
        obscureText: isPassword,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          isCollapsed:true,
          focusColor :Colors.grey,
          filled: true, // Fill the background with color
          fillColor: Colors.white, // Background color
          hintText:name ,
          hintStyle : TextStyle(color: Colors.grey , fontSize: 17),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: EdgeInsets.all(20), //           isDense: true, // Reduce vertical padding
        ),
        style: const TextStyle(color: Colors.grey),
      );
  }
}
