import 'package:flutter/material.dart';
import 'package:grammafy/themes/base_colors.dart';
import 'package:grammafy/themes/base_text_style.dart';

class ToneChip extends StatelessWidget {
  const ToneChip({super.key, required this.subjectName});

  final String subjectName;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: BaseColors.neutralColor.withOpacity(0.4), // Border color
            width: 1.0, // Border width
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Text(
          subjectName,
          style: BaseTextStyle.headlineLarge
              .copyWith(color: Colors.white.withOpacity(0.8)),
        ),
      ),
    );
  }
}
