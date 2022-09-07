import 'package:flutter/material.dart';
import 'package:foodapp_heii/utils/dimension.dart';
import 'package:google_fonts/google_fonts.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow overflow; // kich thuoc vuot de lai dau.

   BigText({Key? key,
    this.color = const Color(0xFF322d2b),
    required this.text,
    this.size = 20,
    this.overflow = TextOverflow.ellipsis
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
            fontFamily: 'abc',
            color: color,
            fontSize: size == 0 ? Dimensions.font20 : size,
            fontWeight: FontWeight.w400
      )
    );
  }
}
