import 'package:flutter/cupertino.dart';
import 'package:foodapp_heii/utils/dimension.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final double iconSize;

  const AppIcon({
    Key? key,
    required this.icon,
    this.backgroundColor = const Color(0xFFfcf4e4),
    // Kh thể sử dụng kiểu dynamic lấy từ color nên phải gán màu
    this.iconColor = const Color(0xff232320),
    this.size = 40,
    this.iconSize = 30

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular( size / 2),
          color: backgroundColor
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
    );
  }
}
