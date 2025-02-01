import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grammafy/themes/base_colors.dart';
import 'package:grammafy/themes/base_text_style.dart';

class ErrorView extends StatelessWidget {
  final String text;

  const ErrorView({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 40.h),
        child: Row(
          children: [
            Icon(
              Icons.error_outline_outlined,
              color: BaseColors.bgError,
            ),
            SizedBox(width: 12.w),
            Text(
              text,
              style: BaseTextStyle.bodyLarge.copyWith(
                fontSize: 48.sp,
                color: BaseColors.bgError,
              ),
            )
          ],
        ));
  }
}
