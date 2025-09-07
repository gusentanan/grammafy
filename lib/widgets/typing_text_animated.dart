import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grammafy/themes/base_colors.dart';
import 'package:grammafy/themes/base_text_style.dart';

class TypingText extends StatefulWidget {
  final String text;

  const TypingText({super.key, required this.text});

  @override
  State<TypingText> createState() => _TypingTextState();
}

class _TypingTextState extends State<TypingText> {
  bool _hasAnimated = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: BaseTextStyle.bodyLarge
          .copyWith(fontSize: 48.sp, color: BaseColors.neutralColor),
      child: _hasAnimated
          ? Text(widget.text.trim())
          : AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  widget.text.trim(),
                  speed: const Duration(milliseconds: 50),
                ),
              ],
              totalRepeatCount: 1,
              pause: Duration.zero,
              onFinished: () {
                if (mounted) {
                  setState(() {
                    _hasAnimated = true;
                  });
                }
              },
            ),
    );
  }
}
