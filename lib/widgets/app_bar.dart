import 'package:flutter/material.dart';
import 'package:grammafy/themes/base_colors.dart';
import 'package:grammafy/themes/base_text_style.dart';

class CommonAppBar extends StatefulWidget implements PreferredSizeWidget {
  CommonAppBar({
    super.key,
    required this.title,
    this.enableAction = false,
    this.onTapAction,
  });

  final String title;
  bool enableAction;
  VoidCallback? onTapAction;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<StatefulWidget> createState() => _CommonAppBarState();
}

class _CommonAppBarState extends State<CommonAppBar> {
  // Cache the gradient to avoid recalculating on every build
  late final Shader _textGradient = LinearGradient(
    colors: [
      BaseColors.primaryColor,
      BaseColors.primaryColor.withOpacity(0.2),
      BaseColors.neutralColor,
    ],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 250.0, 60.0));

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: RichText(
        text: TextSpan(
            text: widget.title,
            style: BaseTextStyle.displayLarge
                .copyWith(foreground: Paint()..shader = _textGradient)),
      ),
      actions: [
        widget.enableAction
            ? IconButton(
                onPressed: widget.onTapAction,
                icon: const Icon(
                  Icons.more_vert,
                  color: BaseColors.greenColor,
                ),
              )
            : const SizedBox.shrink()
      ],
    );
  }
}
