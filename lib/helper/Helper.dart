import 'package:flutter/material.dart';

class Helper {
  Color hexToColor(String code) {
      return Color(int.parse(code.replaceAll('#', '0xff')));

  }
}