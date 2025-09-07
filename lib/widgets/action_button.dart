import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grammafy/themes/base_colors.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final double? iconSize;
  final Color? iconColor;
  final EdgeInsetsGeometry? padding;

  const ActionButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.iconSize = 20,
    this.iconColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding ?? EdgeInsets.all(8.w),
        child: Icon(
          icon,
          size: iconSize,
          color: iconColor ?? BaseColors.pmaBold,
        ),
      ),
    );
  }
}