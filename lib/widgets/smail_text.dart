import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  double height;

  SmallText({Key? key,
    this.color = const Color(0xFFa9a29f),
    required this.text,
    this.size = 15,
    this.height = 1.8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        style: TextStyle(
            color: color,
            fontSize: size,
            height: height
        )
    );
  }
}
