import 'package:flutter/material.dart';
import 'package:grammafy/themes/base_colors.dart';
import 'package:grammafy/themes/base_text_style.dart';

class ToneChip extends StatelessWidget {
  const ToneChip({
    super.key, 
    required this.subjectName,
    this.isSelected = false,
    this.onTap,
  });

  final String subjectName;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: IntrinsicWidth(
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isSelected 
                ? BaseColors.primaryColor.withOpacity(0.2) 
                : Colors.transparent,
            border: Border.all(
              color: isSelected 
                  ? BaseColors.primaryColor
                  : BaseColors.neutralColor.withOpacity(0.4),
              width: isSelected ? 2.0 : 1.0,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Text(
            subjectName,
            style: BaseTextStyle.headlineLarge.copyWith(
              color: isSelected 
                  ? BaseColors.primaryColor
                  : Colors.white.withOpacity(0.8),
            ),
          ),
        ),
      ),
    );
  }
}
